Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B65DC8A969
	for <lists+samba-technical@lfdr.de>; Wed, 26 Nov 2025 16:19:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aLCZ5IQRG4S4UYkf3VihXYPz8/JOTP6xv4YiwhnB/8g=; b=h8HJRoFc3jYHlhasD6M2VoeCZP
	AKiv0pkBR2V0l+ByBk5sWDLDZtSVHKzilVwhLk55E0Xkfp+a7iPSmBmoH37kA1efLTzoDxvyODm2c
	ugMBSrijyax+JnUKe3eIk84q3XN5rB6VWqzYMCcA9XIL9aakKAcjcAF1fiVEY8pBNHbL82VrTiIz9
	fP/Pyvq60APBamjajM32OsCA2YYjCwBIICwA9fDPNtEnADfAmBAK8km2qAbNF0wb8Zk+35guBBBCl
	z7ceGWjLfamT1WjeaWWjyNrpMk28mYtOiWIKiVm8nOyL/naHMDyOdCsdhyTScF/deskmPOVvlebQv
	BlfzF01g==;
Received: from ip6-localhost ([::1]:32882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOHIH-00DO55-7q; Wed, 26 Nov 2025 15:18:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63716) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOHIB-00DO4y-Sf
 for samba-technical@lists.samba.org; Wed, 26 Nov 2025 15:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=aLCZ5IQRG4S4UYkf3VihXYPz8/JOTP6xv4YiwhnB/8g=; b=fsCwMiNiuXukd0mGo234i3ogJ3
 4TpMfRX9sF1crtmB5FsA7xGRZkRqCwvEem2FNJC+RjZiC1HdZ/5QvYQkscYep1LNt8qsZfY8kR8MI
 i8OlE/0x31CTc+c9Sth3ej1tYgvQzCemsJsg/q/QwxTHWesVr5umHi7rvebuqsYFB2Zgp/4T4ghLO
 AglUP0AIWJ7WyeAn6GtY8AiGpDNtnKZUcz9LrxUoMCgwyKCeKR8R22Ijj6dQCqrh/Wi9U5CF5sXX4
 xentPmM45ADuB8vCfPu1t7sgjWHd2VussDM48/AjmTuOaJd2/6i3uaDo+PYv367ycJtpF9zuWFImc
 g5N7m4ImyHs6Pf/H5thqhz30BpFOkzMbTCqhyoW8Q2dg+EzZEbZG7SG/wMpPbxYAV5xsPGmU1+0Ub
 sbkmpOM3pVDBHtqUs2s403+9TDXz/t2vsahwa2LMAxE5o8Xsz4OdQAq79RJUDpI2p6h6InX8qq3//
 3qAifWz39l76SqcseFpL5Or3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOHIB-00FrQd-06; Wed, 26 Nov 2025 15:18:51 +0000
Message-ID: <bd457989-d73e-4098-b3f7-c6871f49d188@samba.org>
Date: Wed, 26 Nov 2025 16:18:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
To: Namjae Jeon <linkinjeon@kernel.org>
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <2786ee25-b543-48a8-8fff-e6c7ff341774@samba.org>
 <CAKYAXd8N-j8K1CUUH9_+wXpEZBo5i=K=ywkQPjJmmo76JbmXng@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAKYAXd8N-j8K1CUUH9_+wXpEZBo5i=K=ywkQPjJmmo76JbmXng@mail.gmail.com>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: linux-cifs@vger.kernel.org, Paulo Alcantara <pc@manguebit.org>,
 samba-technical@lists.samba.org, Tom Talpey <tom@talpey.com>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 26.11.25 um 16:17 schrieb Namjae Jeon:
> On Wed, Nov 26, 2025 at 4:16 PM Stefan Metzmacher <metze@samba.org> wrote:
>>
>> Am 26.11.25 um 00:50 schrieb Namjae Jeon:
>>> On Tue, Nov 25, 2025 at 11:22 PM Stefan Metzmacher <metze@samba.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> here are some small cleanups for a problem Nanjae reported,
>>>> where two WARN_ON_ONCE(sc->status != ...) checks where triggered
>>>> by a Windows 11 client.
>>>>
>>>> The patches should relax the checks if an error happened before,
>>>> they are intended for 6.18 final, as far as I can see the
>>>> problem was introduced during the 6.18 cycle only.
>>>>
>>>> Given that v1 of this patchset produced a very useful WARN_ONCE()
>>>> message, I'd really propose to keep this for 6.18, also for the
>>>> client where the actual problem may not exists, but if they
>>>> exist, it will be useful to have the more useful messages
>>>> in 6.16 final.
>>> First, the warning message has been improved. Thanks.
>>> However, when copying a 6-7GB file on a Windows client, the following
>>> error occurs. These error messages did not occur when testing with the
>>> older ksmbd rdma(https://github.com/namjaejeon/ksmbd).
>>
>> With transport_rdma.* from restored from 6.17?
> I just tested it and this issue does not occur on ksmbd rdma of the 6.17 kernel.

6.17 or just transport_rdma.* from 6.17, but the rest from 6.18?



