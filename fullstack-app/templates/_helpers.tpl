{{/*
Return the name of the chart
*/}}
{{- define "mern-app.name" -}}
{{- .Chart.Name }}
{{- end -}}

{{/*
Return the full name of the chart including the release name
*/}}
{{- define "mern-app.fullname" -}}
{{- .Release.Name }}-{{ .Chart.Name }}
{{- end -}}

{{/*
Generate common labels for all resources
*/}}
{{- define "mern-app.labels" -}}
app.kubernetes.io/name: {{ include "mern-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.Version }}
app.kubernetes.io/component: {{ .Values.server.component | default "server" }}
app.kubernetes.io/managed-by: Helm
{{- end -}}

{{/*
Return the default container image name (repository and tag)
*/}}
{{- define "mern-app.image" -}}
{{ .Values.image.repository }}:{{ .Values.image.tag }}
{{- end -}}

{{/*
Helper to return the name of a Service, used for consistency
*/}}
{{- define "mern-app.serviceName" -}}
{{ include "mern-app.fullname" . }}-service
{{- end -}}

{{/*
Helper to return the name of the Secret for MongoDB
*/}}
{{- define "mern-app.mongoSecret" -}}
{{ .Values.server.mongo.secretName | default "mongodb-secret" }}
{{- end -}}

{{/*
Helper to define resource requests and limits
*/}}
{{- define "mern-app.resources" -}}
resources:
  requests:
    cpu: 100m
    memory: 128Mi
  limits:
    cpu: 500m
    memory: 512Mi
{{- end -}}

