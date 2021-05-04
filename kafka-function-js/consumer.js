module.exports = async function (context) {
    const { headers } = context.request;
    let body = context.request.body;
    let key = headers['keda-message-key'] || null
    let tombstone = headers['keda-message-tombstone'] || null
    let response_headers = {}
    if (key != null) {
        response_headers['keda-message-key'] = key
		console.log(response_headers['keda-message-key'])
    }
    if (tombstone != null) {
        response_headers['keda-message-tombstone'] = 'true'
        return {
            status: 200,
            headers: response_headers,
            body: ""
        };
        console.log(response_headers['keda-message-tombstone'])
    }

    return {
        status: 200,
        headers: response_headers,
        body: "Consumer Response "+ JSON.stringify(body) + " Key " + key
    };
}
