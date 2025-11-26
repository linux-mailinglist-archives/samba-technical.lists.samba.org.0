Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5CEC8860C
	for <lists+samba-technical@lfdr.de>; Wed, 26 Nov 2025 08:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oPr6ACsBWiTdcqqUClYl1qB6tW7HDAHrkWlcUbfwm2k=; b=UopYrALucTVAiH44BKDOpYte/t
	DCeHs8htHRsDYeIeBV+HUDT4DIeEvTg5JHnWPMH1hrgl2PQOh3IfHQ2b7lFS05TH+uQmXCEqPPUoy
	InT2F2swJwp09chBWRR3gIdap9oqLtodC40q9RVhS57AHosO/1nh8eWF4jNKVqOclbsQloGKPYOHA
	8lQfZC/thbFVZRKg2AxF9KeLg8gt5v3Vn2tNXN2cqrG+u4jht0dWIbQHCiZ2hO9gcVTj517cbKgyg
	XDboAbiL2xfHcDplZ1BOycvLdfyFfjba4gTIU/ajdDAz6VORtBUlEGSyIcUEXCbx/CF8CbAlCK+uO
	OvpnCXyw==;
Received: from ip6-localhost ([::1]:19696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vO9lC-00DMkd-E9; Wed, 26 Nov 2025 07:16:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36762) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vO9l6-00DMkW-Ck
 for samba-technical@lists.samba.org; Wed, 26 Nov 2025 07:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=oPr6ACsBWiTdcqqUClYl1qB6tW7HDAHrkWlcUbfwm2k=; b=FLrOuAyE6aSRxiOyZGlnoKS2jW
 fSGFvqNqjRth0K/kTOQqrnyUY+yMO7AHiG6Tc1BZckBQloXv3B0y5nqXYLGGVVRrR+8xb8jMwa8n1
 /UZV+yWVNWRDPI3FQRXf1wNSNlg4TseWFYc01Z+QkGMcbozTa50g200DkiNX7PbzvkZkl9ABKdgFy
 RMbPMMwoizCPTZxDAzmMJMjySKe/8DrnUZI72Evtnkv+qQlGS1pXG4gfUkeisKoQyv9k1RY3NMnIt
 F2Zj5d3NJkRZmagwoJLkGGauV/ektKYEPjRBWcZlaSCneCyY9CHGOsjzIL/UefFVqAI0xu7ksj6oA
 Votb3Uq/x3toGRSxO6UVZrFJJirKw7S9OYoi+/fvp3N9W0cWNCoVewZsUSEHm7EcVZMpJd+wElvFa
 bySM2uuZtzPDTwaGqLhFnDb1JdH78+ILqdNZu5KbSrSEnXwJZdyIVfNri6bk3QRAPXvV+lPbICB4T
 l09AMUjtTp1NrhNjr8qwb37m;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vO9l5-00FnI4-0B; Wed, 26 Nov 2025 07:16:11 +0000
Message-ID: <2786ee25-b543-48a8-8fff-e6c7ff341774@samba.org>
Date: Wed, 26 Nov 2025 08:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
To: Namjae Jeon <linkinjeon@kernel.org>
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
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

Am 26.11.25 um 00:50 schrieb Namjae Jeon:
> On Tue, Nov 25, 2025 at 11:22 PM Stefan Metzmacher <metze@samba.org> wrote:
>>
>> Hi,
>>
>> here are some small cleanups for a problem Nanjae reported,
>> where two WARN_ON_ONCE(sc->status != ...) checks where triggered
>> by a Windows 11 client.
>>
>> The patches should relax the checks if an error happened before,
>> they are intended for 6.18 final, as far as I can see the
>> problem was introduced during the 6.18 cycle only.
>>
>> Given that v1 of this patchset produced a very useful WARN_ONCE()
>> message, I'd really propose to keep this for 6.18, also for the
>> client where the actual problem may not exists, but if they
>> exist, it will be useful to have the more useful messages
>> in 6.16 final.
> First, the warning message has been improved. Thanks.
> However, when copying a 6-7GB file on a Windows client, the following
> error occurs. These error messages did not occur when testing with the
> older ksmbd rdma(https://github.com/namjaejeon/ksmbd).

With transport_rdma.* from restored from 6.17?

metze

