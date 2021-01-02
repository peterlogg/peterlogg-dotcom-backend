include .env
export $(shell sed 's/=.*//' .env)

.PHONY: build start_dev start clean

APP_NAME := peterlogg-dotcom-backend

image:
	docker build -t ${APP_NAME} .

clean:
	@echo "Clean something mate"


deploy_ci_trigger:
	gcloud beta builds triggers create github \
    --name="${APP_NAME}-trigger" \
	--description="CI for deployment of backend application" \
    --repo-owner="peterlogg" \
    --repo-name="${APP_NAME}" \
    --branch-pattern="^master$$" \
    --build-config="cloudbuild.yaml"

clean_trigger:
	gcloud beta builds triggers delete "${APP_NAME}-trigger"
