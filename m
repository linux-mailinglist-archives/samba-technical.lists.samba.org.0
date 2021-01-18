Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 468BF2FA8AB
	for <lists+samba-technical@lfdr.de>; Mon, 18 Jan 2021 19:26:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=059zy8gMPurCRSsXN7noeBg6hRtk7RDmdLnOmramCQo=; b=LEWBi37GTRzOGojh1wdhbpaexG
	OKq1HYzYUEHLhv4WrDAt3ioicUppXLhADIDj5UNXkhetY6dTU2CvUPKR+yUMTzeiKGiLM3/QCEd0E
	MfRezp7fYXwYRWacpLMwJQVaNefE8bCXGLW4euN1rLRl2fcyY/tNc5ECbssdT62b9FTDi4Lu87kQS
	n9x/TGq/ctIvYgEshIxywQhSy8rD2O+aS/XXAGpyLV5qamz3TtW/v20F7Ck2/zu3hffI+V+bEn3sy
	rhnGMCeEBr2HzCvBlILXPxITtKkhyCzKPmw0pq3eyHisO/k6JMttm7dRIANkZxYnhyPPSzvqKZZKB
	kFTNrVcA==;
Received: from ip6-localhost ([::1]:54252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l1ZDu-00652q-9m; Mon, 18 Jan 2021 18:25:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29124) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1ZDp-00651s-Gy
 for samba-technical@lists.samba.org; Mon, 18 Jan 2021 18:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=059zy8gMPurCRSsXN7noeBg6hRtk7RDmdLnOmramCQo=; b=ciizjoJFBLWJwbaH/14GluciuO
 qGXH33svisZclUVxUxfxGoG+bsHUSV4MFUJqnyxYg8rTjeUHXXFhENAafzYnd/p5b8fXKKtZ8BEVH
 bMinid1E5tpdMMHRoc5WIQkqc2h1u8yIDZ3UFoHw46kwUH8jNl3d3kCup7J9lmAGmb+axGYfY5plT
 UPBVEM/8otbnUElYxvIYwAFvGFfE6xlvqWkajviOdQ0uvQ/X7yJ+jvxYceyZ5HkLyFB8YpPU/zmqE
 ocWWp1qgLMlnIajQwT1OB3n2sqvcoR1DdGQhik76AwL2nVOQRcgQqdjcrA5romRMcnKVmMr+qCuTl
 xpaSi9UmuahrjRQV/XYf/ARyPlYNpTLJHV9psbHW+TU0huU+SGHq25HA14QuPI3/XuGeO16pbNLIT
 0oVLbPfY+L85ocSCL7WRoNT0LSJdDHoiBGpdeIYFTdPiWjmV7DZOXJLg+PMo3L5HwK+vjacHZ5vGy
 Di247zPMfwjS/fBw3xJGI9+l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1ZDj-0004xW-UT
 for samba-technical@lists.samba.org; Mon, 18 Jan 2021 18:25:44 +0000
Subject: Re: printer driver type 4
To: samba-technical@lists.samba.org
References: <7781e141-42b9-17c6-278e-9094edf39ee0@kania-online.de>
 <16983374.jckQO7Hm9i@magrathea>
 <1e5edc1f-01be-fea0-d318-ae1ca770c0e3@kania-online.de>
Message-ID: <814e3b19-2d7a-f5b7-91ab-047678e74139@samba.org>
Date: Mon, 18 Jan 2021 18:25:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1e5edc1f-01be-fea0-d318-ae1ca770c0e3@kania-online.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 18/01/2021 18:14, Stefan Kania via samba-technical wrote:
> Hi Andreas,
>
> Am 18.01.21 um 17:39 schrieb Andreas Schneider via samba-technical:
>> On Monday, 18 January 2021 16:15:07 CET Stefan Kania via samba-technical
>> wrote:
>>> Hello,
>> Hi Stefan,
>>   
>>> I'm wondering when will Samba support printer driver type 4? For many
>>> printers it's not possible any more to get older drivers.
>>> Is there some development going on?
>> there is currently nobody working on this. The work in progress branch has
>> been rebased but nobody worked on it since 2017
>>
> So in a few years printing will be deprecated? At the moment some
> companies still develop type 3printer driver but I think they will stop
> doing so. One reason might be the signing of the drivers and Win7 will
> be really dead and no windows-user needs type 3 drivers any more.
>
>> https://git.samba.org/?p=gd/samba/.git;a=shortlog;h=refs/heads/master-par-ok
> BTW the link is dead, is this a sign :-)))

Yes, it is a sign that git.samba.org appears to be down 😁

Can someone give it a good kick (or whatever is needed)

Rowland




