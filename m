Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A4191EACC
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2024 00:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=y8Bhnl/79/tuHQPMDokXEp8u+EJPl83LHsZGzfBt2P8=; b=2tphC/9e7UArtuFGt5mDUS/JYQ
	n8dOoqjJvbHJWr4WOU35ExbXM8zRT66yBFXVCw8d3/MIKWPVc6+tDzZEN67d21NBwem6zaH8tHtAH
	EyOe6opd2hoUj7lr3EufQnlLJBthR3zX+0x04fbueeZhxI82OXJ0Z1sSBkxLiRhrRcvFyRkv/PzW6
	3MM0sOFaQT5b6048q6oEhc2qNrA9eAz+uQqqJazKwsbp4vcEQXL/Lrh1ERd1WAjMNN0eetvL9GURb
	wb0DCsx9oDLFIob/Bht5nJUtm055iCNdF7DZGbCtX103UU44da1/0qX3ighBnarXJT6TOqdfboz/P
	tI/N4r8g==;
Received: from ip6-localhost ([::1]:48084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sOPQX-0031ET-O5; Mon, 01 Jul 2024 22:23:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27786) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sOPQT-0031EM-4a
 for samba-technical@lists.samba.org; Mon, 01 Jul 2024 22:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=y8Bhnl/79/tuHQPMDokXEp8u+EJPl83LHsZGzfBt2P8=; b=InMvUduGunqb+bfE6QXlPWQ+5E
 KFT8sMVUsbJv9yVwsjI2aBe9rvPB/lT7kYFUn3G/UHKKKoLdFnEfTdokc6td/gQbiPdpo82f6j2UX
 yjOUqkQPx4ZXoTz+ay9Vi2CYLyGD5oRb1y7d8BBtm0ISTyb9cVqkP4v7qQxv9xHzMvObUwB0Pnqya
 oKRdlnpVfRTJsyFObFoYve5eGjngE0uJ03Q+V5VuKDtWnZUYq2RNjdETht1Xkbvsbg3w1Lc7meV3X
 JtRYQtwzeEvr8e5MdXNHga0UtcYtNmXn8KnZxP6krR/LTMR/ew7zxoi4LuYxHOkfkJlgGLn6uptXv
 mi6Gxbuo63H9Orfl3t02g7X/5t/B5ocyxoECD8y7LKz9HexBRoO/noFjBs/RcuvSkczhwx9/Z8hCn
 AcBFfR7rMND6j44clVD7ZVAdCANEWfBzEQvoqzskbgMPXLaEJAIz3mhp55FS367fbXlBoIxMy3+vL
 Y2xz17cXn0JmpOlGIaU2yQrP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sOPQS-001urA-0c for samba-technical@lists.samba.org;
 Mon, 01 Jul 2024 22:23:08 +0000
Message-ID: <5108f6c8-4344-4ef4-97f0-a2d0a4edce74@samba.org>
Date: Tue, 2 Jul 2024 10:22:59 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Announce] Samba 4.19.7 Available for Download
To: samba-technical@lists.samba.org
References: <efc3606d-23f0-442c-a994-46fb374b7bc3@samba.org>
 <e7c529cf-6b3b-47d5-b438-d4e96eed33ee@samba.org>
 <9171cd49-0955-49a2-842d-2c7ad1585101@tls.msk.ru>
Content-Language: en-GB
In-Reply-To: <9171cd49-0955-49a2-842d-2c7ad1585101@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jo Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jo Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 1/07/24 7:47 pm, Michael Tokarev via samba-technical wrote:
> 01.07.2024 07:27, Jo Sutton via samba-technical wrote:
> 
>> Hi, I’m not sure if this is the right place to report this, but a 
>> recent Samba 4.19 CI pipeline gave me the following error:
>>
>> 2024-07-01 03:59:51,858 samba-def-build: [check-clean-tree] Running cd 
>> /tmp/samba-testbase/samba-def-build && script/clean-source-tree.sh in 
>> '/tmp/samba-testbase/samba-def-build/.'
>> The tree has 1 new uncommitted files!!! see stderr
>> ==> /builds/samba-team/devel/samba/samba-def-build.stderr <==
>> The tree has 1 new uncommitted files!!!
>> git clean -n
>> Would remove lib/ldb/ABI/pyldb-util-2.8.1.sigs
>> 2024-07-01 03:59:52,263 samba-def-build: [check-clean-tree] failed 'cd 
>> /tmp/samba-testbase/samba-def-build && script/clean-source-tree.sh' 
>> with status 1
>>
>> It appears that the file lib/ldb/ABI/pyldb-util-2.8.1.sigs is missing 
>> from the release?
> 
> This file is both in the tarball and in git repository.  I'm not sure
> what you're reporting here - everything seems to be okay on the samba
> side.
> 
> Thanks,
> 
> /mjt
> 

See https://gitlab.com/samba-team/samba/-/tree/ldb-2.8.1/lib/ldb/ABI. 
‘ldb-2.8.1.sigs’ is there, but ‘pyldb-util-2.8.1.sigs’ is missing.

See https://gitlab.com/samba-team/devel/samba/-/jobs/7228952270 for a CI 
job that failed as a result.

Cheers,
Jo (she/her)

