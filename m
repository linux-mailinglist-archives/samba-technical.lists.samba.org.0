Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F3F9D8E24
	for <lists+samba-technical@lfdr.de>; Mon, 25 Nov 2024 22:41:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=f7C0yZRnQXT/E/C63iHachaCa1Qg6OZno+FiTC+wEiQ=; b=Y8SEC9GzJ1DMuo3XAOhcjyxVgc
	49GPfJyhWEgNrZct/r5x0hcWJSPtyVmd7ezb1yxq2DLGI0wls0+1z8+fMrjWJSAvNaXtuqwZkoovM
	/3M7day97ok5pKGVYJsJA5tgXL6a65g1exV8+Uw87tJmX5EMqFTHaI0FPeoUYcSq1n5/GTQZ5IsBa
	PtctDwVc+89pUwni+sEjCH2kTn/gOlzAEI3SnaTNsGSSP1FPZDXjiuM1dL5nGSg8NyY+IsxLg33up
	T8JUw5vn6DEOQ/WjL3ntz+Mn2QBcREqTiPvUF99ysKDp11/F71PM/Xj5sBakKllWqWDUx4Q3P7UMI
	ox+DBlJg==;
Received: from ip6-localhost ([::1]:53956 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tFgpf-000oJW-68; Mon, 25 Nov 2024 21:41:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32256) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFgpa-000oJP-5A
 for samba-technical@lists.samba.org; Mon, 25 Nov 2024 21:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=WIHdGNq35PSXiFAlB18ghb5eEmvnD+JWew7YdOgaUkk=; b=lYEJvyFgE+DXyyP0u9mkiiMrEB
 ++j4jPbpkiMgqmZO7xCiwQVL4VaOaiwZmuXlrNVlcnBGsEbTf/KXnZ2QTgeXGWCXH+X0B13VgWoON
 HdbYGH7LT8Xnc4V0q4of6JkFcPwddPCYOeEnRA3lcFZvTZAQ33E8e6la3RjGoVQEhxlQAyl0XYgrq
 WyTIUuaPPNyMK6g46Vi72A/he0bqlQlzYJH+2yLOTFRcj+zh8U51zQc+KsDOzQUM7SlmfrIeAJIE+
 XfooPOoYp1GX+kdVR6YkFUIMpTD5Ng4fKh5q7SAQUpUL6vgFp7PKXyIfCOkZI8SNWBW1Q8R4H7ZM3
 1WuC6rmTNrOF2IPMnhAGtkidtLcpkid27HQV9dpGGmhDDB8m8CVlUTVI6XWEX5hPJDDk0MIO2ElfK
 Q/AwdmWxCmCD3DxpDPCaCMUEovBpxHqFr4IC0fUxfo3fP792O6JegPd9KneUk69vq95JDrR/COROJ
 bawSfg3u+8/oJd0/ItwNNRz0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFgpY-001RSC-21; Mon, 25 Nov 2024 21:41:17 +0000
Message-ID: <99f968a92a7fd8de4a93bc0ee2ed8ffcd2208b3b.camel@samba.org>
Subject: Re: heimdal 7.8 crash (in OpenLDAP) with spnego/ntlm, is this
 familiar?
To: Nadezhda Ivanova <nivanova@samba.org>, samba-technical@lists.samba.org
Date: Tue, 26 Nov 2024 10:41:12 +1300
In-Reply-To: <55aec456-0370-426a-b143-a59acddba5b1@samba.org>
References: <55aec456-0370-426a-b143-a59acddba5b1@samba.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: metze@samba.org, okuznik@symas.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2024-11-25 at 16:08 +0200, Nadezhda Ivanova via samba-technical 
wrote:
> Hi team,
> An OpenLDAP user encountered this issue, and since Samba also uses
> Heimdal too, we were wondering if maybe it has happened in Samba as
> well and was fixed? Do you think it is something that can affect
> Samba? There are back traces in the issue but no steps to reproduce,
> it seems to happen randomly in their environment, and we haven't had
> any feedback from the Heimdal team yet.
> I could not find a relevant issue in the Samba bugzilla or the
> commits, but perhaps one of you remembers something?
> https://github.com/heimdal/heimdal/issues/1189

Samba strictly avoids using the Heimdal SPENGO and NTLM layers, only
selecting the GSS-Krb5 mech to use our more mature internal
implementation and so avoid this kind of issue
Sorry,
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
