Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C446CF760
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 12:44:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=aJr5KM12bbJMcQS3FR6voXNHFRsKmwBw+0FH0gXOAXA=; b=EAqVzsWjSK5J0QMFeGcK4CAwWZ
	kxssEPP1mJrvDEhRhtXRUp8oILpe9a8es3wXV9VF//lpkfTiGsLmg/Nv/t2oFYTmvz+kfsL+aioeO
	7mJBs1TvpfaQpRvd6gOQrkcIk9HhCiQxxd8NP99LJHL8Pvki9CB8TZiGLH6l+FG8kIVfEfad6HXfk
	MEIx9WpUT58um0TOYnouFMcJR8Re5SBB+YSWrS+wZnHlES/7VljP2KprWjKRM/TawoqCQOvSFILu0
	qHiRXd79BEGPm8IxDl9RgVPDWAyKqRSvezVWSl0/tBMLf7RZTlrmw3r1CJKZlbif8Wxfx+SvMB2is
	op+NBGPA==;
Received: from localhost ([::1]:43206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHmxx-0023xJ-KD; Tue, 08 Oct 2019 10:43:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47474) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHmxs-0023xB-TB
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 10:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:Cc:From:To;
 bh=aJr5KM12bbJMcQS3FR6voXNHFRsKmwBw+0FH0gXOAXA=; b=lriIsBFyK3D11Y30i2tYsKyoFX
 01bRoU/dpEz/QI2utohH/vJhpSo9oPulgOfyxJem3Zcpvh/3VZAQj29cicQ3E+zjS5j3LVQU3Jx4W
 980dfFwhUsXHyTB89QE/qYX5p09M04J70STFRMalEdbLmom4DuDIM4nDUpwztaDmVxTo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHmxs-0005X3-86; Tue, 08 Oct 2019 10:43:36 +0000
Subject: Re: Samba and legacy Windows support
To: Andreas Schneider <asn@samba.org>
References: <5849953.E8HlOTvGIY@magrathea>
Message-ID: <b650575c-58cc-8602-34f1-be5dd28a8601@samba.org>
Date: Tue, 8 Oct 2019 12:43:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <5849953.E8HlOTvGIY@magrathea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas,

On 10/8/19 10:59 AM, Andreas Schneider via samba-technical wrote:
> Samba with version 4.11 currently still support a lot of systems which are 
> already out of support. We still get bugs to either fix support for Windows 
> NT4 or OS/2. Also we know that Windows Server 2003 with Active Directory is 
> still deployed.
> 
> In order to remove support for those platforms which are very long EOL, we 
> should try to make announcements when we plan to remove support.
> 
> ## Steps planned
> 
> With Samba 4.12 we plan to disable SMB1 by default

as already pointed out by Rowland: mission accomplished with 4.11. :)

> and then remove support for 
> it in Samba 4.13 or 4.14. This means end of 2020 or beginning of 2021.

We can't remove it unless existing SMB1 tests are converted to SMB2.
Thankfully, it seems David and Noel took the stab. But we can't announce
until this is completed.

> If we remove support for SMB1, we could also remove support for NTLMv1 and 
> Kerberos support for DES, 3DES and maybe RC4. Already on Fedora 31 use of 
> these encryption types is blocked by the default system-wide policy and is not 
> available through MIT Kerberos. DES support is fully removed from MIT Kerberos 
> 1.17.

Sounds good, though crypto is not my game.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

