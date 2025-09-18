Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E27CB2F3EA
	for <lists+samba-technical@lfdr.de>; Thu, 21 Aug 2025 11:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kU4MAUJPB7nvDSaS7IwKgrnzZ3ivFi/cWT9fnihEpWY=; b=TMAKIP55dr3AmpQ4XAsPEQO9o3
	Ie7Gw9DcijGkmFuykok3zuAyfUrZZPlC3VunEQ1WdXBXo60LuzkaOmilrte2PJ7cLmF1A3pAhTDS4
	LL7zsxWi8IlwfDYvBuR5iLjs6hEUsn6mmA2xtSa1sV0DkpMiiUkxXTHrGYSr2f3sqiiEqEQz6iVTh
	+pzVWDP2j2DvPv87P/ZXULBcIyiS7Ych2mZx4hvKxaOK0++YT182ZsnuLEJp6EjLoxBnadeLA1jMf
	5GxEVZj3YAmPNzZSM+EXp7EGGkUkKqmu+KwtIb15V5C2/wNH6Q1wVbpXZGeYsbP9m7YZpGlh1LAIw
	CrYKaXIw==;
Received: from ip6-localhost ([::1]:42744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1up1br-0001Mw-Gm; Thu, 21 Aug 2025 09:29:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10774) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1up1bm-0001Mp-Qk
 for samba-technical@lists.samba.org; Thu, 21 Aug 2025 09:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=kU4MAUJPB7nvDSaS7IwKgrnzZ3ivFi/cWT9fnihEpWY=; b=2enP6qosethV3Ej7v6pVTW04RH
 DxWlK6oHmiNBCtGAxcgOasPP0WA0nx3pCi2vVZ2VCwCQ6CpVgT5WQZGbj1JAo7EIzAHPSO7f9Zxg4
 /4m9pOorqrmO+MCr/wHtLHJwc4nAKBttfRN3lcoUxrTI5A4O64ONTclMM9xffdn7tlBq8Xe4poV0b
 f7xr37gJQ19VO15wUaeO2toRMa9AQ63LxbgQT2e7a5D61tbOOgQhrl00tOMyk8rZdfhbqltAtjVpR
 6AnDjRmZ+f3vl6BJD7Xyjs3ojINYjHWTN/804kSuplPH8AglQ2ZbGstsCzDTAYiA2mvISVjaZVH5Z
 X5UUK9iEM2jS1C3PGVx0Sc2DFtoO+1Rv/LpPb63YQISvmRiGZHQ8M+jJmBUvIRswuU6DKg/oGF/RP
 sd5oQaw3eohJ81EarRrJ1LYuQOAhQ+GtlVznlspo9/Xs6MrWKnkvrV4tZR8C0thNLHQYKgfutdL6C
 Mho36QxXX1FC04GYYbQSTfcX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1up1bm-00031p-1l; Thu, 21 Aug 2025 09:29:22 +0000
Message-ID: <b7e57b81-8aeb-4c92-8dff-f637cc287c31@samba.org>
Date: Thu, 21 Aug 2025 11:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] smb: server: fix IRD/ORD negotiation with the client
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
References: <20250821092439.35478-1-metze@samba.org>
Content-Language: en-US
In-Reply-To: <20250821092439.35478-1-metze@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Sorry, I messed it the git send-email, I just send a v2 for the single patch

Am 21.08.25 um 11:24 schrieb Stefan Metzmacher:
> Already do real negotiation in smb_direct_handle_connect_request()
> where we see the requested initiator_depth and responder_resources
> from the client.
> 
> We should should detect legacy iwarp clients using MPA v1
> with the custom IRD/ORD negotiation.
> 
> We need to send the custom IRD/ORD in big endian,
> but we need to try to let clients with broken requests
> using little endian (older cifs.ko) to work.
> 
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>   fs/smb/server/transport_rdma.c | 101 ++++++++++++++++++++++++++++-----
>   1 file changed, 87 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
> index 5466aa8c39b1..20d1f53ca989 100644
> --- a/fs/smb/server/transport_rdma.c
> +++ b/fs/smb/server/transport_rdma.c
> @@ -153,6 +153,10 @@ struct smb_direct_transport {
>   	struct work_struct	disconnect_work;
>   
>   	bool			negotiation_requested;
> +
> +	bool			legacy_iwarp;
> +	u8			initiator_depth;
> +	u8			responder_resources;
>   };
>   
>   #define KSMBD_TRANS(t) ((struct ksmbd_transport *)&((t)->transport))
> @@ -347,6 +351,9 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
>   	t->cm_id = cm_id;
>   	cm_id->context = t;
>   
> +	t->initiator_depth = SMB_DIRECT_CM_INITIATOR_DEPTH;
> +	t->responder_resources = 1;
> +
>   	t->status = SMB_DIRECT_CS_NEW;
>   	init_waitqueue_head(&t->wait_status);
>   
> @@ -1616,21 +1623,21 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
>   static int smb_direct_accept_client(struct smb_direct_transport *t)
>   {
>   	struct rdma_conn_param conn_param;
> -	struct ib_port_immutable port_immutable;
> -	u32 ird_ord_hdr[2];
> +	__be32 ird_ord_hdr[2];
>   	int ret;
>   
> +	/*
> +	 * smb_direct_handle_connect_request()
> +	 * already negotiated t->initiator_depth
> +	 * and t->responder_resources
> +	 */
>   	memset(&conn_param, 0, sizeof(conn_param));
> -	conn_param.initiator_depth = min_t(u8, t->cm_id->device->attrs.max_qp_rd_atom,
> -					   SMB_DIRECT_CM_INITIATOR_DEPTH);
> -	conn_param.responder_resources = 0;
> -
> -	t->cm_id->device->ops.get_port_immutable(t->cm_id->device,
> -						 t->cm_id->port_num,
> -						 &port_immutable);
> -	if (port_immutable.core_cap_flags & RDMA_CORE_PORT_IWARP) {
> -		ird_ord_hdr[0] = conn_param.responder_resources;
> -		ird_ord_hdr[1] = 1;
> +	conn_param.initiator_depth = t->initiator_depth;
> +	conn_param.responder_resources = t->responder_resources;
> +
> +	if (t->legacy_iwarp) {
> +		ird_ord_hdr[0] = cpu_to_be32(conn_param.responder_resources);
> +		ird_ord_hdr[1] = cpu_to_be32(conn_param.initiator_depth);
>   		conn_param.private_data = ird_ord_hdr;
>   		conn_param.private_data_len = sizeof(ird_ord_hdr);
>   	} else {
> @@ -2016,10 +2023,13 @@ static bool rdma_frwr_is_supported(struct ib_device_attr *attrs)
>   	return true;
>   }
>   
> -static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id)
> +static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
> +					     struct rdma_cm_event *event)
>   {
>   	struct smb_direct_transport *t;
>   	struct task_struct *handler;
> +	u8 peer_initiator_depth;
> +	u8 peer_responder_resources;
>   	int ret;
>   
>   	if (!rdma_frwr_is_supported(&new_cm_id->device->attrs)) {
> @@ -2033,6 +2043,69 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id)
>   	if (!t)
>   		return -ENOMEM;
>   
> +	peer_initiator_depth = event->param.conn.initiator_depth;
> +	peer_responder_resources = event->param.conn.responder_resources;
> +	if (rdma_protocol_iwarp(new_cm_id->device, new_cm_id->port_num) &&
> +	    event->param.conn.private_data_len == 8)
> +	{
> +		/*
> +		 * Legacy clients with only iWarp MPA v1 support
> +		 * need a private blob in order to negotiate
> +		 * the IRD/ORD values.
> +		 */
> +		const __be32 *ird_ord_hdr = event->param.conn.private_data;
> +		u32 ird32 = be32_to_cpu(ird_ord_hdr[0]);
> +		u32 ord32 = be32_to_cpu(ird_ord_hdr[1]);
> +
> +		/*
> +		 * cifs.ko sends the legacy IRD/ORD negotiation
> +		 * event if iWarp MPA v2 was used.
> +		 *
> +		 * Here we check that the values match and only
> +		 * mark the client as legacy if they don't match.
> +		 */
> +		if ((u32)peer_initiator_depth != ird32 ||
> +		    (u32)peer_responder_resources != ord32)
> +		{
> +			/*
> +			 * There are broken clients (old cifs.ko)
> +			 * using little endian and also
> +			 * struct rdma_conn_param only uses u8
> +			 * for initiator_depth and responder_resources,
> +			 * so we truncate the value to U8_MAX.
> +			 *
> +			 * smb_direct_accept_client() will then
> +			 * do the real negotiation in order to
> +			 * select the minimum between client and
> +			 * server.
> +			 */
> +			ird32 = min_t(u32, ird32, U8_MAX);
> +			ord32 = min_t(u32, ord32, U8_MAX);
> +
> +			t->legacy_iwarp = true;
> +			peer_initiator_depth = (u8)ird32;
> +			peer_responder_resources = (u8)ord32;
> +		}
> +	}
> +
> +	/*
> +	 * First set what the we as server are able to support
> +	 */
> +	t->initiator_depth = min_t(u8, t->initiator_depth,
> +				   new_cm_id->device->attrs.max_qp_rd_atom);
> +
> +	/*
> +	 * negotiate the value by using the minimum
> +	 * between client and server if the client provided
> +	 * non 0 values.
> +	 */
> +	if (peer_initiator_depth != 0)
> +		t->initiator_depth = min_t(u8, t->initiator_depth,
> +					   peer_initiator_depth);
> +	if (peer_responder_resources != 0)
> +		t->responder_resources = min_t(u8, t->responder_resources,
> +					       peer_responder_resources);
> +
>   	ret = smb_direct_connect(t);
>   	if (ret)
>   		goto out_err;
> @@ -2057,7 +2130,7 @@ static int smb_direct_listen_handler(struct rdma_cm_id *cm_id,
>   {
>   	switch (event->event) {
>   	case RDMA_CM_EVENT_CONNECT_REQUEST: {
> -		int ret = smb_direct_handle_connect_request(cm_id);
> +		int ret = smb_direct_handle_connect_request(cm_id, event);
>   
>   		if (ret) {
>   			pr_err("Can't create transport: %d\n", ret);


