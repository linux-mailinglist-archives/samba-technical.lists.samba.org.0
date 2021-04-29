Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4F636ED9C
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 17:48:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=mF79C+I3q4Ke4OoaNo/VNNrqzWD4MwV8SbapRgglL5Q=; b=u40gkYM742LrFWG0+baHT7Mm/T
	rMZ2e0JfHv0Ggxmr8X6x9JyHLgtZhcdCRRKVp+MQyZApKTf8Tw+KqBOKTt3GS8AIzZR5OcAww+E7c
	p/A+X0N5NFcaKag4AvqsKBvJYJDz2WsT4SScd9evOuXiTfy5rR4HLzc7llH0mo7/O9Hz/4MNvIGDB
	AI0K0vWVIx2M2RSzjJ1AP+cBtGMyrdUkK5LOpzdhAJp+OMAfi8TBDVLPl2zauaYz0D56s7QKWWtwH
	qanz54zHhDgyaymXBuzVLwYxkxrb37avCRm100shmOfACAPznLxWIol+ilxURXdSd+kSXr4t+7e3H
	fa3bBY+Q==;
Received: from ip6-localhost ([::1]:63042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc8sv-00DCxx-6d; Thu, 29 Apr 2021 15:47:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12246) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc8sp-00DCxp-Cu
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 15:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=mF79C+I3q4Ke4OoaNo/VNNrqzWD4MwV8SbapRgglL5Q=; b=YOC6wvgbpJpRiQciSJob3kfiKJ
 VeEIsRG+t6EkwvUjDFqbqPFU1UTHhbFftJFnqKztOSbNd2iksI3cXsi3yeIHtjgp53urWydPY7VpI
 yev+4ctTUvzx1qbeLQWE0mguKyx5RffWw9tbpN4bGOGm1eqxauV5dfWnpryo57S7/mGuahnDhrlMD
 r6wl1/CRxD5jDLaF48BxR2ZApTJEQ/+Nw7YFKO2Q2hsnk9iB0sEJLx+qFBSseZyr1oM8vyApFknP2
 f9iicL+3uktuGvuVajKUmvfh+0/TzFamhedCzEXbJsi4exWsr7hLYIDnq+hprcVBOQeFrdWj4/raL
 bCj0ElDUeJ0jTNpnkIMa0d5IqcTeJJMRNiph8yjfrEyMd8PboasYj74mBP31ZrmuqvyzYsN5xK1sF
 UpbAiMOZa5GN31WkqOt7Q90UA/5cB0jIriJQLU5/d61jN39Jz2VxEMJyIADfjD5t5ANuY8i4mH833
 UPNwTMPW2DGx2Nmo5ZbNP7Ln;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc8sp-0006Rb-4E
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 15:47:19 +0000
Subject: Re: Ubuntu's ADSys
References: <YIaZmO3WleOfenUn@pinega.vda.li>
 <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
 <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
 <RCZBSQ.RP64LWX1DB4B@suse.com>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <acec7e80-744f-4098-4afd-23b5c8b88b4a@samba.org>
Date: Thu, 29 Apr 2021 16:47:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <RCZBSQ.RP64LWX1DB4B@suse.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 29/04/2021 16:07, David Mulder wrote:
>
>> I was curious why something that had just been released with a big 
>> fan fair, didn't work, so I decided to find out why and, seemingly, I 
>> have. The problem, from a Samba point of view, is that it depends on 
>> sssd, so precludes the use of Samba. If 'adsys' can be forked to use 
>> Samba, then that might be an idea.
> Samba already does group policy via samba-gpupdate, and it happens to 
> work with both winbind and sssd. ADsys says they provide "password 
> policies and user access control, and Desktop environment settings, 
> such as login screen, background and favourite apps". We already 
> provide password policies, and user access control is in master. 
> Adding desktop environment will be trivial (and much of this is 
> already in the works). We're providing policies for smb.conf, ssh 
> settings, sudoers, scripts, and more. Seems to me we already have more 
> to offer than this ADsys thing does.


You are probably correct David, but we aren't pushing it like Ubuntu is. 
Whilst you are doing great work on this front, there are still gaps to 
fill, ADsys somehow interacts with Apparmor, but I don't think Samba 
does (yet). What I was suggesting was that maybe we could gain some 
ideas from ADsys.

Rowland



