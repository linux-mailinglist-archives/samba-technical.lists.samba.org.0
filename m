Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0332400827
	for <lists+samba-technical@lfdr.de>; Sat,  4 Sep 2021 01:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=opK70MDmntwEQFJsDmRQVarbZokC4JQx2/AgYyJVHJE=; b=NRYWq2Dv/Tx8Yhuwe3p04GbiRg
	AJ5bIJh0VsSm4FR9DvVIe7JUkZoI2J11LdrQP7cfQkhOKOk2koe3A+gqXBmLEyJwJ80TR+iArdXJL
	GsP76hDr7tQhk5uwNEScXmvUmC0lIRXCFZ9LYCCfbOEmvTKi7v8070brPsVPqVoORQb706DtajpPw
	K3iY7IGBy2KnPxmtq+B2Z6/vRJ7fKH1BzNkDOdpGgzMZb8FG199kbl4RnD8jM31/wKoUwkPufI3K1
	SD/M067bRzc1o3bikG9G4fbh9sDM2DH/HMGLqXLEPuzkRFbRF9SOjfzm/EwkwX083nFQC2CBGBLbG
	3QCMgcZg==;
Received: from ip6-localhost ([::1]:59178 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMIRj-00DFCe-D9; Fri, 03 Sep 2021 23:18:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29068) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMIRe-00DFCV-5L
 for samba-technical@lists.samba.org; Fri, 03 Sep 2021 23:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=opK70MDmntwEQFJsDmRQVarbZokC4JQx2/AgYyJVHJE=; b=lA80LSxl+sUdJhBipNslKsP1EX
 7sboJd5Ai78CucH1WqBzazPZZW1n9WPdYAAS0mJ5lJeHCx4WMS8uboxwmib9+hCZ/tIVi85JGNJ6V
 cdCLZCa2Bmf9Qius473n59SE73wBkO8KTsximX4a8H8ZeY8Avm0WuREwdGTMULSWj4Pf/UaQbVzq+
 0SjLJpMz04kZRrnxYDIw+MBtZeCk2vMrv94hZgjavBjEFMlUD2zu8Der4lbCsV+9wttDKRHihsxJ8
 B9AGBILXNc/vXrbRRyDIMsosnWXwAMqll5TQLchSAM74GvZDHo0W7kxjAU2D1PwT2TpJ+MYSZGG8A
 aDaRKc+++i68GgfYN9PGR3ytFmWdE3dFFhs1OTnDvCrwfXbKLdBwkTl5zRlFWYc5ZHNX+gJ7c/XRm
 2QdC2ZsuHFuRmb4Y9vbe1pui1KhAKawWFwTbQbYZCJQ2l3ibI7K9LuTUGH2wYcY6gEcm0lsiIOG/A
 n+7xY5hDGo912zjFBUEEh3CA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mMIRc-004XEV-HL; Fri, 03 Sep 2021 23:18:01 +0000
Message-ID: <432aec71099f5ada02ca65ecddad2c45b9f3b126.camel@samba.org>
Subject: Re: Help writing new SAMBA_INTERNAL DNS test code please.
To: Matt Grant <matt@mattgrant.net.nz>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Date: Sat, 04 Sep 2021 11:17:53 +1200
In-Reply-To: <92a66d96-fea3-2a00-6585-7cb15487a468@mattgrant.net.nz>
References: <CAHA-KoObp6CvJg05wbSypST_4eAtGhuTg9eUkcBYw+PTV612og@mail.gmail.com>
 <YS6StQYsctrwXzvu@jeremy-acer>
 <9f99c5977e7743e615936f070ce8e085a73ed1fb.camel@samba.org>
 <CAHA-KoMdUq9JVWd5ZburyG7cEQG3sGF-N8-99GhQbz-0+Z3qLg@mail.gmail.com>
 <48bd2c937e15b5baa5f82b3e9cd0d0cdaf2e44a8.camel@samba.org>
 <92a66d96-fea3-2a00-6585-7cb15487a468@mattgrant.net.nz>
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

On Sat, 2021-09-04 at 10:21 +1200, Matt Grant via samba-technical
wrote:
> 
> If I recreate my git commit to grantma/dns-forward-port, will git
> push
> 
> -f completey replace all the code I previously pushed to gitlab and
> 
> still keep the current merge request?

Yes, this is the correct approach.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


