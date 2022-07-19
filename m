Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AC057A5DE
	for <lists+samba-technical@lfdr.de>; Tue, 19 Jul 2022 19:56:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=k1VGhG+NXRy7XtLhWLHXCjGSF+yI2m4gJLKqPzSGOPY=; b=2GfWwpmgHIl+3b5IMDQ3wEr2qj
	jYFsOGholTNO01kTOpi/OA3S1oXaudPdRKKWTQZzhUl0dNgZ3v9A7Js4KIPlite4rLrUBw+qYJKQm
	O8Hie4eL/AEZZsPi3eCIqDGKIeCDvbNZJI50Vd0S80HCP0GxomlhK0gOjCyo9PySESiTpvWB8YyI4
	hT0+20+sjnLetaeflXcoNiKnwDWNqZDiesVzATjBtuG3s/MRZog1hz7j1AUOw4MrZEc/6rUcO5Wti
	Agdd2BXsJaJFiZU7kKbY0NMC8508jpU0YnretCwkXGhh355WtumObLxFAZV6Y+w80LiO5s2pJOzoo
	UbjJmNuA==;
Received: from ip6-localhost ([::1]:58968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oDrSZ-000u8q-5d; Tue, 19 Jul 2022 17:56:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52618) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oDrSU-000u5P-L3
 for samba-technical@lists.samba.org; Tue, 19 Jul 2022 17:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=k1VGhG+NXRy7XtLhWLHXCjGSF+yI2m4gJLKqPzSGOPY=; b=ojsggXWQ7oIMe9fwZqvosYVciN
 FIGWr+0tAHcZ0BAioo1gydyyq1DQZrEBWjdVeH6+XsfrEscNCrUKpICHOgaNQw29guSKjErTm8udg
 HZJdLbKUKWoqt/qTUDOIq+fGgmgxm8TjOpyKGTXWPt0A4+sVWiO/GWIzOOwACgMBTgIYpEEX3Ir1A
 gVEWZ2Xoh7HzV3bl3nB/dcbWGR/BrFW0Erdsc2l0W7VWLup2963FeVY15EmhZZdK2VhAM+TMrTjqN
 44ZzDbLsA71ZVWCDKgoiEeWqjevLtxIdvXH43jzU7mLGKCtvZ3Vu7UJxIho0euzQFOH/jGPc2MXOk
 +Ty/dEGJQYhrovm3oeF8W7SudnKymHTyyKainUv8oQeEghH65fOSDv1gbdMoJCPYo3H2DMM1vwJRV
 nSFTCSINQUjWErnFCdmZbbI+/Jl03P3xzf+BDVraWKrHuPTJjHPRzqVwlXFRDQT6/EDt1+hV8RQoc
 bbZwlP9OEgvWUysa7yIJmOKb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oDrST-005VDC-Fg; Tue, 19 Jul 2022 17:56:33 +0000
Date: Tue, 19 Jul 2022 10:56:29 -0700
To: Shilpa K <shilpa.krishnareddy@gmail.com>
Subject: Re: Issue if SearchResEntry and SearchResDone CLDAP responses are in
 2 packets
Message-ID: <YtbwTQoc8Fq1L/58@jeremy-acer>
References: <CAHbM3qimf=1xi0+UMZa5QFKDr0_JdHz2MF=T-bMBO8ZAhuzP8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHbM3qimf=1xi0+UMZa5QFKDr0_JdHz2MF=T-bMBO8ZAhuzP8A@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 19, 2022 at 09:20:09PM +0530, Shilpa K via samba-technical wrote:
>Hello,
>
>We have a setup where there are 3 DCs in a domain and Samba is joined as
>Member Server. 2 of the DCs run Windows 2019 and one of them was Windows
>2008. Windows 2008 DC was decommissioned. Samba was joined to the domain
>when Windows 2008 was available. After Windows 2008 was decommissioned, net
>ads commands started failing as below:
>
>ads_try_connect: sending CLDAP request to <IP>...
>....
>cldap_netlogon_recv for domain <DOMAIN> failed with status
>LDAP_PROTOCOL_ERROR
>
>Upon checking the network trace, we noticed that in response to the CLDAP
>request SearchRequest, Windows 2019 DCs responded with SearchResEntry and
>SearchResDone in 2 separate packets. Checking the code, it failed below:
>
>NTSTATUS cldap_search_recv(struct tevent_req *req,
>                           TALLOC_CTX *mem_ctx,
>                           struct cldap_search *io)
>{
>...
>...
>status = ldap_decode(state->response.asn1, NULL, ldap_msg);
>        if (!NT_STATUS_IS_OK(status)) {
>                goto failed;
>        }
>        ZERO_STRUCT(io->out);
>        /* the first possible form has a search result in first place */
>        if (ldap_msg->type == LDAP_TAG_SearchResultEntry) {
>....
>                *io->out.response = ldap_msg->r.SearchResultEntry;
>                /* decode the 2nd part */
>                status = ldap_decode(state->response.asn1, NULL, ldap_msg);
>--->failed call
>                if (!NT_STATUS_IS_OK(status)) {
>                        goto failed;
>                }
>        }
>
>...
>}
>
>The 2nd ldap_decode(..) fails because:
>
>
>/* Peek into an ASN1 buffer, not advancing the pointer */
>bool asn1_peek(struct asn1_data *data, void *p, int len)
>{
>...
>        if (data->ofs + len > data->length) {
>                /* we need to mark the buffer as consumed, so the caller
>knows
>                   this was an out of data error, and not a decode error */
>                data->ofs = data->length;
>                return false;
>        }
>..
>}
>
>Here, after the first call to ldap_decode(...) in cldap_search_recv(), the
>value of data->ofs and data->length was 163 and len was 1. len was 1
>because of below code:
>
>_PUBLIC_ NTSTATUS ldap_decode(..)
>{
> ...
>        if (!asn1_start_tag(data, ASN1_SEQUENCE(0))) goto prot_err;
>...
>}
>
>We think the issue is because SearchResEntry and SearchResDone responses
>are in 2 different packets. Could you please confirm if this is so?

Yes, the cldap_search_recv() code expects the replies to be
in one packet. As Ralph says, if you can share packet traces
we can possibly add code to do a second packet read if the SearchResDone
response isn't found in the first reply.

