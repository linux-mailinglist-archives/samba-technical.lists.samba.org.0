Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D965760BC24
	for <lists+samba-technical@lfdr.de>; Mon, 24 Oct 2022 23:28:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=HNj7JTidOsPBwtfvwmQp8Ya9rT1nErvr+rSZNS0OgJ8=; b=w9c+sLYRBMaGYN8t46mkwwWsic
	yot/P773LPptUbcIkYARwoAjapQaDAyywBO8TC0Ep8CRaayx5mlEHQYC8FAcArgXbUbHSy03uqmxv
	3ezwJnVUjtWAiHU4efrHjRGTVspd8kPanMDLx17N+cQRsZB/iv1yZ8LUn3JMqrJyeZlCf4CzU1gEI
	HKnIiLs9xRbkrKwngQdMpha+64ygquIMtshb6RqsZZipKgPh3L9u2ieE+TpGxQKxVT5BWGqDEDZ7K
	zNCmdt4YqQw5TTXgwqyHCl1prlUX9J1Q8v7sOqGvEQH+WXc/nNeBqnnYDahkz+cv/5sNLUj+DSvhm
	iWEqsfOQ==;
Received: from ip6-localhost ([::1]:38008 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1on4zB-005Zjb-U0; Mon, 24 Oct 2022 21:27:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38244) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1on4z6-005ZjS-Fq
 for samba-technical@lists.samba.org; Mon, 24 Oct 2022 21:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=HNj7JTidOsPBwtfvwmQp8Ya9rT1nErvr+rSZNS0OgJ8=; b=Wccv2zyjcvK+h+j0ffYdgyv/90
 ZOW3cT3LGjeAprJq8pXuEe2jN481kQzOtIz1i8hS2qyVMJ458a+0DlWQ+b4Cjq0Jo5FIpVV0WORmw
 ytx2yWLaOCQXUmr3IwQLY27ydC/P846c34rz3nwOu3fptOwOWYlJSwiof6MnLWNsUR4PQkYGAorMe
 A0tOm25yyIEKoSApcAthAVxdwr2F5DstWIM+cyYkGBv5ETwysci+f0NySI0N6ZEbiAW8w9UN12GyL
 ujzmeHq7K9F9YvSdvRPK19oCAvooVz2T4GtVpx2dAHO4+wecHtlv0VN1jPYsXg9y6oGZfbMxq87Cb
 Y+URjPF9E2FhJCEj6WrmwCXAMWuy/kgk5ODVz70zCC8wivNUpUIDVJC6SX5Tt2PIQLUEBvntfIeej
 Wq40IK8ioC2t8kR4YoAqC7bAj9KaI+WyB6RyrmH7x+AMlp3lF91kSkHeWyMWHwSGVOhnbolfEBlRh
 e7WAZi0VVAslcoTKUDjDSLu7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1on4z5-005aRS-F7; Mon, 24 Oct 2022 21:27:48 +0000
Message-ID: <db0531ab8158841c10ddbc9d6b9ff031c88f8860.camel@samba.org>
Subject: Re: Could we move to GnuTLS 3.6.13 minimum and Ubuntu 22.04 as our
 primary testing distribution?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 25 Oct 2022 10:27:44 +1300
In-Reply-To: <fb434777e5cf9c369de54b4c47b894c162ce91b6.camel@samba.org>
References: <fb434777e5cf9c369de54b4c47b894c162ce91b6.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: asn@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

(Corrected subject, I realised we couldn't go GnuTLS 3.7 and don't need
to so far)

On Tue, 2022-10-25 at 10:24 +1300, Andrew Bartlett via samba-technical
wrote:
> It is a bit of work, but I think it would be very worthwhile to
> upgrade
> to Ubuntu 22.04 (replacing Ubuntu 18.04) and GnuTLS 3.6.13 as our
> minimum requirements.
> 
> We would also need to update OpenSUSE Leap 15.3 to OpenSUSE Leap 15.4
> as like Ubuntu 18.04 it doesn't have the package. 
> 
> For CentOS 7, we are already pulling GnutTLS 3.6.16 from an appstream
> repo it seems.
> 
> This would allow us to remove the last of the in-tree AES code,  as
> well as automatically test the new PBKDF2 based password change code
> in
> SAMR. 
> 
> This came up because this MR:
> https://gitlab.com/samba-team/samba/-/merge_requests/2753
> 
> is not automatically tested as it is behind an #ifdef not triggered
> on
> Ubuntu 18.04
> 
> What do folks think? 
> 
> Andrew Bartlett
> --
> Andrew Bartlett (he/him)       
> https://samba.org/~abartlet/
> 
> Samba Team Member (since 2001) 
> https://samba.org
> 
> Samba Team Lead, Catalyst IT   
> https://catalyst.net.nz/services/samba
> 
> 
> Samba Development and Support, Catalyst IT - Expert Open Source 
> Solutions
> 
> 
> 
> 
> 
> 
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source 
Solutions






