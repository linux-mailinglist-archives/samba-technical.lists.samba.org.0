Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 885502D726
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2019 09:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=IHGNexR7tAINAHAS72ToI5epaUe8JVV/DMU6zvz3Uqw=; b=wlAmDa2c5zRxDuxJdy0WJ9jcv2
	LKjxXfPMpxpHUD08O0n1dR3jrvp4p4kO3fJtKQNNTfyW3LWtB1/WQJIGQmGnHoiDKkZOWPVlndxFT
	B8ZHxj7xPntbbpAOKvXpMwaf7ZoLgwNgY0Butmlyu6GM9woxeNoFRh+9EWa6NHCAVMNy/zXryrTyL
	8uZsYL09qaBareuopolTP+xeDqFaSqx2r+WroM1ZxyW9ztlKLgYfmpw8pAzxc11T2HNy+Md2uVcYd
	zoZWcO2ntaMtRIjFvWRmbPAE2nJ4uEJTlqrGqAcy+rHta75g13KEU1VT6sqRt8CLI2o3w9ysDJaig
	lG66whtQ==;
Received: from localhost ([::1]:19082 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVtTV-002S9g-Ga; Wed, 29 May 2019 07:58:17 +0000
Received: from [2a01:4f8:192:486::147:1] (port=38414 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVtTR-002S9Z-G2
 for samba-technical@lists.samba.org; Wed, 29 May 2019 07:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=IHGNexR7tAINAHAS72ToI5epaUe8JVV/DMU6zvz3Uqw=; b=uu34bwapCNkBU2lM2MZ/PcENNt
 3dhR+aHCf0Og6BvywdXw6M0K0zFb86KCPoU2AjkXRN8y6yp4DQy9ZDvPYh40dlbyUgj5R3cWflp4+
 xUikGWHoaK8Lnc4j4uMF/ONa628Aoiqc3d9MppA3Mek9cXDdU3DKnzHqsyNl/Ga7X7iU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVtTL-00083S-PF; Wed, 29 May 2019 07:58:07 +0000
Date: Wed, 29 May 2019 09:58:06 +0200
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: [PATCH] Fix compile error with --enable-selftest
Message-ID: <20190529075805.zc4qabjyb7plsajg@inti>
References: <42f879d1e0abfd4dd2e6c299b9184a7dfc5afacd.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <42f879d1e0abfd4dd2e6c299b9184a7dfc5afacd.camel@cryptolab.net>
User-Agent: NeoMutt/20180716
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Anoop,

On Wed, May 29, 2019 at 12:10:53PM +0530, Anoop C S via samba-technical wrote:
>Please find the attached patch which fixes the following error while
>compiling with --enable-selftest configure option:
>
>...
>

Lgtm. Second team reviewer?

Thanks!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

