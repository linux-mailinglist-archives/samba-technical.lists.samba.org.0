Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9784C31170
	for <lists+samba-technical@lfdr.de>; Fri, 31 May 2019 17:37:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=JAeJko+ol5qVyuR5AaI57hG3Zk4HI9cAIFe5u6Cer8s=; b=ZvAv1/NjOcjyCixKjPSiwTg2GI
	mH2J9c2VKBPQLVgPtLd946nIsteGQ0T6gEw+5pViMT9JpzFlvaY0iR0ISdkaj4ycbcLuqmPkMpC0B
	jbA4kbsBMQhfUOz+nS9Hcdl2h4YxGPzjctcfdh+S3zqHxI3tRc74rATDv0GrGhkdSzKrC3f3eTIir
	mBa+WEtvf7yMt7jGWHVsw2SKBgZxEZ/RSl2L8/gNX/Ty0GqNZ3T6K1YTXnxscZ2DtTewt8FOWBKxN
	zdQhsL/OP+WPfnQKTJ9uS2RrbhwgsV8zNcrzTNdkHrV2UBOosWWxC3Egmk6wE2TcrBQvY26TCcDKy
	94vtlrMQ==;
Received: from localhost ([::1]:26622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hWjaV-002kxA-De; Fri, 31 May 2019 15:36:59 +0000
Received: from [2a01:4f8:192:486::147:1] (port=31532 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hWjaM-002kwy-C9
 for samba-technical@lists.samba.org; Fri, 31 May 2019 15:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=JAeJko+ol5qVyuR5AaI57hG3Zk4HI9cAIFe5u6Cer8s=; b=XZ45rjEvRAmRrLOgq30bOk2jok
 kGk3oCMsrKMGZ6o7TzkUnAzH3+Bl4xBbzA7VXPqgVcphU+3aiGXRMbFjwU3kBsG9/f2lH9XV+ritG
 rDviPJztdQrDMaic1ZuTdOLswNLdHvsWgv3CBOKGOTCjAPpR1ENN62OW5m32NmbJKjVA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hWjaF-0007QQ-T8; Fri, 31 May 2019 15:36:44 +0000
Date: Fri, 31 May 2019 17:36:40 +0200
To: Amit Kumar <amitkuma@redhat.com>
Subject: Re: [PATCH]: winbind handling NULL sids (bug #13914)
Message-ID: <20190531153640.baezcpth3t4l7qmy@inti>
References: <b7d91e0e-e654-3452-37a0-dfbda4936296@redhat.com>
 <b59fbffd-c363-47f1-29eb-621676d5eb52@samba.org>
 <0cc22df8-b48c-73c8-74ad-e1e602b8096a@redhat.com>
 <20190527140812.qeyamc5kzomgipuj@inti>
 <6aa5bc8a-24f1-8bf5-5f58-99b3df1e84fd@redhat.com>
 <20190528095640.fcn2gm5gb62qoqel@inti>
 <bd98b9d8-ec9e-4cf6-6351-e35d724c82cc@samba.org>
 <cfa5b581-096d-7b08-24e5-010009fda94e@redhat.com>
 <2e4a105b-9ca1-0c1e-d890-a1c1c61c799a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <2e4a105b-9ca1-0c1e-d890-a1c1c61c799a@redhat.com>
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
Cc: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 31, 2019 at 06:53:42PM +0530, Amit Kumar wrote:
>Hey slow/metze,
>
>https://gitlab.com/samba-team/samba/merge_requests/515
>
>Pipeline again failed.. cannot understand why!! can you try understand why?

we have a bunch of flapping test, you can try restarting the failed job.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

