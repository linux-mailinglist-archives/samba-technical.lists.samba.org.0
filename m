Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 331E14E5AE4
	for <lists+samba-technical@lfdr.de>; Wed, 23 Mar 2022 22:50:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Hjjgq+XSld92eQc/oiZ2K8m0qXjAoDo4KsCv6iYOXyc=; b=Bi6WqhTiUJOz8qaZmL/0SbG991
	1yGpYeeKczVFIeYzgmKrfIgng6kF6PHDlQF8GoBu0M6alvaBK/RxMGpal96dQa13Q/GZZYAdMRFLS
	458ENpwUcuphM/SkoU9F9h8pPHliYCbFbIqeE29M7nYdRtXz7427ZKS7+mxNxRb0ecFbRhEWvvR0I
	Rq9MXv62Y6qHoKZoFo0dvxgF3RaM+THtHzi0vszn8w+/YCYPNmsqaWicioGOa6Lm6UALCr2Vy//UW
	A2zM9I4CrTxAUrSVjS70ZlLMDm+T5IleChbnX1brpnZa0aOorMKO2AKfhqKO9+oCiYF2E7tQvppT7
	iOLV3q0w==;
Received: from ip6-localhost ([::1]:61234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nX8sB-004fUe-Hw; Wed, 23 Mar 2022 21:50:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37810) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nX8ru-004fUV-NK
 for samba-technical@lists.samba.org; Wed, 23 Mar 2022 21:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Hjjgq+XSld92eQc/oiZ2K8m0qXjAoDo4KsCv6iYOXyc=; b=Ln3hUrOrk8rQIFmDWWvwgUVFhz
 ejdtUV+vYe3cJOQqS98wwD03jXfvte8K5oilsViwmf0GbIXVpLWvEl6fgib4ef8fhrNbVAEkcyle4
 9gw0TV/V9xa74938QEINVUcAb64qco5UBcRqs8ivYNvbbJtfQZcPOKk2A6CJLFcVnF1DGgz4TJJRV
 9LUXLThOnB+iMz71rzv/6/WCmvs6bhba/4Q0yoSlVTFGje3vSBaeQOYGOQglsrdDxaluU14CWAJfv
 OYlvRuHfYRteQk3PjtSrbK+b2tHNYD4OXwy+hFWcKTTuZf4r5VrtOoJwizN9ora6o1TYEbQjfP+yq
 lJJXkYSwtpzzkpk/uvH6/JZxSyfjBT6EwJQWtpaJl/JDLd2k8lco0Qpq86jaTNhp1S5Yi5g5f0hzP
 D+YE6s7mnudRT/rGCWqHUQgRqEliqDA7G9D172FSeRbr1ieeSFdrjFUxNbnTKh66f7se0l828xiJ1
 zpciF/9FR6sMAg2ifE6ofvRZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nX8rs-00376x-H0; Wed, 23 Mar 2022 21:50:13 +0000
Message-ID: <aa7f95e04eaab625d7839c5204bc3283ded73984.camel@samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
To: capricorn cap <cool_capricorn80@hotmail.com>, 
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Date: Thu, 24 Mar 2022 10:50:08 +1300
In-Reply-To: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2022-03-23 at 21:41 +0000, capricorn cap via samba-technical
wrote:
> Hi!
> I have joined  4.5.16-Debian to AD.
> sudo net ads testjoin
> Join is OK
> getent passwd works
> getent group works
> 
> But When I try to browse from windows computer then I get popup to
> enter username and password.
> Below is the log message.
> 
> Kerberos ticket principal name is [xyz@TP.NUTI.LOCAL]
> SID S-1-5-21-774976744-1476728229-930774774-3891 -> getpwuid(13891)
> failed
> Failed to map kerberos pac to server info (NT_STATUS_UNSUCCESSFUL)
> 
> Can anyone help me that what can be the solution to fix this issue.

My guess is that nss_winbindd isn't running, or else there is something
fishy going on with idmap, but either way you are running a very old
version and should run a supported version.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


