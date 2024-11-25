Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E39D8E2C
	for <lists+samba-technical@lfdr.de>; Mon, 25 Nov 2024 22:46:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zrJ76tH1VDkMLtdiGyMSBiEzt+/w0ujnuECx8oVALtQ=; b=ITDNJwvgVcvOYKXsiwCDv9y7ug
	igSlo0rWWEM/arDHtTcCAz8GTISFbRbdesdEr2RSinWb0G0jiX23sJ5skiJfE/+95nu1ZgdMY65kN
	Po9U0z8+gafg5aKwDJGxzB9mRexr5dbl2qlxbWGhGn3gRzad6L64f7Mxy/8i92KH8iZupwTlqKigd
	dEM88IoLmfE3gDGs5o7r8WptfyfoFBi52Fws9gYqQdCUMBwQGKR/q3KCyHgR4/eJi3NOMxumjdFUQ
	jqibcTJIWvNWNQCP99U1v5PkENeKh0+4B3T4V9m+D1Q1dXU/69utiCL9cDl+3e2sqoAfe/PpDfIKC
	pK81Erug==;
Received: from ip6-localhost ([::1]:39590 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tFgua-000oOf-Dj; Mon, 25 Nov 2024 21:46:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13416) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFguV-000oOY-PX
 for samba-technical@lists.samba.org; Mon, 25 Nov 2024 21:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=BghesDJfKxZe3r4cpx/TYsfng0CY9e96c9gwNxkCNck=; b=FcKXoz7VmXpzIZb3Q3Y3YWydg5
 LwFFDzEK4VYU/1K0u0nxhlz3Gngk2sKK10IfGs9hThmh6nzZgVdgl3JtMApdt25ImMedrK+v41O2e
 OBcF3KcJCqjHz+1Xd+nbs/vt6aDjaxwWf7I52+YdFFgXhSuG/HehPhdwDPm/Sn39BFrS8z1d0qmvp
 d2vX8wuh7DOeozux8oL9Elw2tAPqUlH3zjwxaRr5z/ZX3JhnSCclHd9SMElIkjOPY/NBzGl3wRf+w
 D4XLfSKPp4P508yTgN1yCYCtnOuD0MvtU1k5FHzVstzcFKoJ7V9f+CDod6NNjK8lNGJ1/lcX4ppmo
 JVFaFcqQCXW4sMcM62cDpyxxNJj4C1PK67XkbB37V8Iw6U3GWOAbPqtsEKfeO7IVr0C4OBpBMMLB+
 DTg/dGlatcTojYcvgjhU4CGEz7wgtzoA1lbKExRtXTP45mkPVO+WRaNtL3sKvucsIFKrdFnRQwne4
 yHBeLO9wRhS4qw9Qr0o3+V3Q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFguU-001RVu-0V; Mon, 25 Nov 2024 21:46:22 +0000
Message-ID: <b402788c-34da-486b-b02f-03afbfb1322a@samba.org>
Date: Mon, 25 Nov 2024 23:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: heimdal 7.8 crash (in OpenLDAP) with spnego/ntlm, is this
 familiar?
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <55aec456-0370-426a-b143-a59acddba5b1@samba.org>
 <99f968a92a7fd8de4a93bc0ee2ed8ffcd2208b3b.camel@samba.org>
Content-Language: en-US
In-Reply-To: <99f968a92a7fd8de4a93bc0ee2ed8ffcd2208b3b.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Nadezhda Ivanova via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nadezhda Ivanova <nivanova@samba.org>
Cc: metze@samba.org, okuznik@symas.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks for answering! I thought that may be the case, else Samba would 
have stumbled upon this a while ago, but I thought I'd ask just in case.

Regards,

Nadya

On 25/11/2024 23:41, Andrew Bartlett wrote:
> On Mon, 2024-11-25 at 16:08 +0200, Nadezhda Ivanova via 
> samba-technical wrote:
>> Hi team,
>> An OpenLDAP user encountered this issue, and since Samba also uses
>> Heimdal too, we were wondering if maybe it has happened in Samba as well
>> and was fixed? Do you think it is something that can affect Samba? There
>> are back traces in the issue but no steps to reproduce, it seems to
>> happen randomly in their environment, and we haven't had any feedback
>> from the Heimdal team yet.
>> I could not find a relevant issue in the Samba bugzilla or the commits,
>> but perhaps one of you remembers something?
>> https://github.com/heimdal/heimdal/issues/1189
>> <https://github.com/heimdal/heimdal/issues/1189>
> Samba strictly avoids using the Heimdal SPENGO and NTLM layers, only selecting the GSS-Krb5 mech to use our more mature internal implementation and so avoid this kind of issue
> Sorry,
> Andrew Bartlett
> -- 
> Andrew Bartlett (he/him) https://samba.org/~abartlet/
> Samba Team Member (since 2001) https://samba.org
> Samba Team Lead https://catalyst.net.nz/services/samba
> Catalyst.Net Ltd
>
> Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group 
> company
>
> Samba Development and Support: https://catalyst.net.nz/services/samba
>
> Catalyst IT - Expert Open Source Solutions
