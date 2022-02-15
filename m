Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 841CD4B673F
	for <lists+samba-technical@lfdr.de>; Tue, 15 Feb 2022 10:16:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=isvotgJ3DhWYd8KVSBMCPFceNuqZF0bZ1ydfSKj9xSk=; b=3g9Vqhi3bY6Sh+ZEqMsgIB2civ
	2I47h4ZaeLw0FJHvd11fVo2z90UPKeYzQ3w4PA65HHhl5OUr7xKerwrEqUq8BFuCN1myfz5iuXRJ4
	VRaI04W0ISstcj7qy8vILSAiMz2o40sDpqO68UD5IFN7ARigD9BKWOlcdj1oAt7fwt+X6xr+e3DjI
	ssweqZxNF3Ry60aHzbZkCk7BQqlc0W9zK+a27AJxuEIWS3D71PGojO9lfjy/jQGHjntZ4o549ieku
	7WdN3g+7MJDVuDYE5t4ZOBDaaBvlJxzKua3k+pLk3bNVOfGcqTiQbWJ+Nac9Q2KGTcitinE5FRjNl
	VIVqHk4w==;
Received: from ip6-localhost ([::1]:50958 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nJtvl-008aO2-5C; Tue, 15 Feb 2022 09:15:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49008) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nJtvg-008aNt-9n
 for samba-technical@lists.samba.org; Tue, 15 Feb 2022 09:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=isvotgJ3DhWYd8KVSBMCPFceNuqZF0bZ1ydfSKj9xSk=; b=FUBHzmDlTITpwmS+mUFgACQsKs
 JHYoXNKRg91jZ82Pd3YJBO8ciQeE8Ba7iz/hxBt62HxghF8Vqy5a0trMQ4lh9or9ZPGgXp6Be1Lp7
 DS2Sm7f1TEtKqwNZtHWiZa/xncUWO0J5Cr7cZWwACPWCQXnDcpzvjnTEDg9wUTjGLRbqIx6/zORP6
 SgHyRot58AvA0IpthpY0+Tim4E6q3wPJN+7j/BOCScXaiX7peUTwNk5S2nVpiAdvQDh97gAP1YugT
 5gbEdcRTSXsssWygVMsIVQLogXHMc1e1anAe83KeKdiNyp5waWUAAnQN0hCKN8ztsQkFsyvp/pQS5
 V70z2kXzeq6ZvlFfXNAj8aeBXZP0XGZpagR7K3JIXGHBD3HQ91r/HQx10KMdVoFWFoOIbg7LHfSv6
 HyAbLh1BjNp1LuoK30ooRSZjDDmz9aMp6ARZlKN6eB8MC9jQL0vG887EkPrp/qWt01xCc+JREMFWt
 +Xc4j9T/6GWpbTOM7Tz/AsUj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nJtvd-003pvx-Nw; Tue, 15 Feb 2022 09:15:21 +0000
Message-ID: <056415d0-b357-d7b8-9a56-cf1cf3eac0df@samba.org>
Date: Tue, 15 Feb 2022 10:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Heimdal upgrade: Re: [Announce] Samba 4.16.0rc3 Available for
 Download
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <3bed4df7-3f56-de41-e14a-1b5f989ba523@samba.org>
 <5dc4454e3ffdc7a0bd1b889c2d99e64d460cc655.camel@samba.org>
In-Reply-To: <5dc4454e3ffdc7a0bd1b889c2d99e64d460cc655.camel@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 15.02.22 um 08:52 schrieb Andrew Bartlett via samba-technical:
> On Tue, 2022-02-15 at 08:36 +0100, Jule Anger via samba-technical
> wrote:
>> Release Announcements
>> =====================
>>
>> This is the third release candidate of Samba 4.16.  This is *not*
>> intended for production environments and is designed for testing
>> purposes only.  Please report any defects via the Samba bug reporting
>> system at https://bugzilla.samba.org/.
>>
>> Samba 4.16 will be the next version of the Samba suite.
>>
> 
> This is a note to myself as much as anyone, but just so it is written
> down somewhere:
> 
> We need to mention the Heimdal upgrade, the resulting FAST support and
> the limitations (useful to Linux clients only really).

I just noticed that some parts of the heimdal client don't
work with non-FAST servers, so I fear we have a bit of work to do before
we can release the final 4.16.0...

metze


