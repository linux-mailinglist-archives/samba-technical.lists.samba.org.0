Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B0F672239
	for <lists+samba-technical@lfdr.de>; Wed, 18 Jan 2023 16:57:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=TnZWFcWmNxBYxlm36v8cfD5yZDpkKQ0aC3UZSD0jltk=; b=Ro06bf5OyL0PhAR7owwjj32Qap
	sItpIwVRgdM8QSmbw4k0vUt4k2vdaNbn1QUslcqx+C+Mu4f1YnLuSpn6ReRTqwXuu6MoIxlUPeLoJ
	+ovz+Mnwvt47+nNO5/U5dOSzdisS3M6XIvp07xSOIJuYtMlWQRLZzJigdu0m+2EZuaS/Z8EjY7+OH
	OlRpb5sX5nMNkrVSpIbqrypWqa1eu1OlGV4seTo6ibu+H1D8JRjW79JIsTIydcPsg+0N6D0uN15dU
	P2XxVblyxY61X7o3Av3t1/QxezeN8XwtGc6DqsM4eymtpEPLq1ibp94K84PuTLqFNh2gYbKbATmG+
	Fe4aOuLA==;
Received: from ip6-localhost ([::1]:24074 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pIAnj-000Vxy-Jr; Wed, 18 Jan 2023 15:56:35 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:36780) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pIAnd-000Vxp-NG
 for samba-technical@lists.samba.org; Wed, 18 Jan 2023 15:56:32 +0000
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-15bb8ec196aso24154546fac.3
 for <samba-technical@lists.samba.org>; Wed, 18 Jan 2023 07:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TnZWFcWmNxBYxlm36v8cfD5yZDpkKQ0aC3UZSD0jltk=;
 b=wj7S76lZhgHNR/wz3qfMP29apc9hMbtbb5WF2C14Bo++5qkvJ4e7cUbAUDGb9J8QCX
 dzSYBgXtRaI++DQRqSSnYNv4SrPLLoVODS8JWIRHGIHcR24PSlF8sq5bNoyRdh8yv11i
 ATgVH2qgsjkEIuGwgsnQQ2woSpnbZ52db2BBqubVJuLYazxHpNBeE6rgv/hoU+sdGeAl
 jGCKsQIYzIkT8m8OYTEmlcQIt+IXAglqZv1DhGOuTztsGG/Ene1Ox27Si18bdlJal0Sa
 KiNNb73l/YhY8HBEaMZgGsFEny0fGoERIWiUzrpAw0MpO9tp8jaWbCcb7duo6AvCQFBx
 I+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TnZWFcWmNxBYxlm36v8cfD5yZDpkKQ0aC3UZSD0jltk=;
 b=jJOsFnSkBcvjXeIAjtWd3UhVqY7+Sm2Atlpf2KPV1GkTNb7dX7VPmoKi1uUYF5ydju
 OzyZaAapvsDNXdwk+i88KrcQA2WYmwwGVBtODgNpTcWxqdt4ccs3EbflhBgvbg9vCLqD
 9FbuRgjoxjlejf14/XpvSIXZkQqXKO64MksuPzkpi3MGdtvz3iOoDLUjNlflwtsDQArn
 v4rmkg/x1lY3oyGnWWFyoSwV+USWXZRISJae+zZNRXLEM7l7kclgNphsI9W6vU7WIdq7
 whzq4urqZG0VNiug7ytjNOWwwXns9juSgz/Cgy54wZ1EZ/Q2qsACCgltC7u+3tmLUmpf
 d2iA==
X-Gm-Message-State: AFqh2kobn6IovTY2FeQLdnV2RtqQOBMwxsGhF3mmkVI+pzrDCidxCL+D
 LtLwLu/ZWgDhSmLYEJKm3JLP7w==
X-Google-Smtp-Source: AMrXdXtO0qt6CqcaBM6jnu8tk2EWZ2JoCctBJbQ+Cucb0k7ebKS2GvCT120dezrjMJvHRCuOSiXiYw==
X-Received: by 2002:a05:6870:9564:b0:15b:a3dc:d5f6 with SMTP id
 v36-20020a056870956400b0015ba3dcd5f6mr789144oal.3.1674057377075; 
 Wed, 18 Jan 2023 07:56:17 -0800 (PST)
Received: from [192.168.1.94] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a4aaa85000000b004cb050fd09fsm16663392oon.29.2023.01.18.07.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 07:56:16 -0800 (PST)
Message-ID: <b3cbaa88-9b01-e82f-bcfa-2fccc69b37c4@kernel.dk>
Date: Wed, 18 Jan 2023 08:56:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Problems replacing epoll with io_uring in tevent
Content-Language: en-US
To: Stefan Metzmacher <metze@samba.org>
References: <c01f72ac-b2f1-0b1c-6757-26769ee071e2@samba.org>
 <949fdb8e-bd12-03dc-05c6-c972f26ec0ec@samba.org>
 <270f3b9a-8fa6-68bf-7c57-277f107167c9@kernel.dk>
 <2a9e4484-4025-2806-89c3-51c590cfd176@samba.org>
 <60ce8938-77ed-0b43-0852-7895140c3553@samba.org>
 <79b3e423-16aa-48f1-ee27-a198c2db2ba8@samba.org>
In-Reply-To: <79b3e423-16aa-48f1-ee27-a198c2db2ba8@samba.org>
Content-Type: text/plain; charset=UTF-8
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
From: Jens Axboe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jens Axboe <axboe@kernel.dk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 12/28/22 9:19?AM, Stefan Metzmacher wrote:
> Hi Jens,
> 
> any change to get some feedback on these?
> https://lore.kernel.org/io-uring/60ce8938-77ed-0b43-0852-7895140c3553@samba.org/
> and
> https://lore.kernel.org/io-uring/c9a5b180-322c-1eb6-2392-df9370aeb45c@samba.org/
> 
> Thanks in advance!

Finally getting around to this after the break...

I think your initial patch looks reasonable for doing cancel-on-close.
Can you resubmit it against for-6.3/io_uring so we can get it moving
forward, hopefully?

That would also be a good point to discuss the fixed file case as well,
as ideally this should obviously work on both types.

-- 
Jens Axboe


