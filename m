Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF913C91971
	for <lists+samba-technical@lfdr.de>; Fri, 28 Nov 2025 11:17:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UwpGB15RNS1gh7r7F2sTmfX4pPRDfbjW6ye/CDDRgW8=; b=NzVsl9fs0MDNLjjYeECqeuAlQ8
	xVCqBNy37vC2deTY5DDX6A2ueu/qrZHOGHd5lKVfEIsfL4rZa4/jjO6slqLJhcNkGeb25zm8Bx6pM
	TJrcQRYTuGm9uKvMGqmlkFMQpjOQTMnQ/WgAwskhfLiTob1uNHeaWQYex0b6ENelJc0xZG8jQR94l
	a/tFHJfzUHpH3weLu9OzqPAp7xErLgiS9+jEv1XVQbE98cBpzrnW67wSqx8dVk7rGKErpr7VgsGPH
	mCa8EriA6smKXwKPLR2pjcYDyJPQeHxY2ER1aI0asvLo3xhQJchr9CEeCgHcV3zQwF/KMUU3/giXZ
	sgKQ/6Hw==;
Received: from ip6-localhost ([::1]:45340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOvXb-00DVbh-5N; Fri, 28 Nov 2025 10:17:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61584) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOvXV-00DVba-IR
 for samba-technical@lists.samba.org; Fri, 28 Nov 2025 10:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=UwpGB15RNS1gh7r7F2sTmfX4pPRDfbjW6ye/CDDRgW8=; b=G3uqdu40A08RNd8T+LMpi22uYh
 2uBs7WgEmovVouQ517tJyso+rep3HQDhcu0WckujU9g/qeM5rokrV6D7vIQrnqxzVwtHlsAykJGE7
 lnDGUt/oRBxzTgRD8hvspKK36+QE/PGc6xJHdBqbcmvY+rkb4xc/VzWENQqNvMggn6BiDYgaxyUUp
 RDocEbgpb8VfzGKAA1V20VXOqrLvXvBYbULDtQX8rwn0SgWjLmF4CCMfoO+mT0qI+jZ7z/wxzsG/G
 iEWAuvupYzIF5/reON7buH45pIK3wuK32xAe6+Kos69ofGii5tlJbiTjjPl3CrG1nO8cwTqV8bDwP
 jn9QWdHhHsoBUk/Xch/rOkmnXMV+ZqE0Cg1OO1cxWVT8x9Dpqb9Ipqcg6OqkJiKnG0Lg/BVrkbhHS
 B9nmoe+IbxDRJ4iasxCA7qZY8Ik7E0wwoUq63O6uRtZ+YAEVDFk0kP9XXjZXkAs+FFIGPGdOW3WW5
 DxwViHNOGgfYlyPbd000HtK8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOvXU-00G7qD-2G; Fri, 28 Nov 2025 10:17:20 +0000
Message-ID: <b1f6271b-3c2a-493a-a404-7cdacd791acb@samba.org>
Date: Fri, 28 Nov 2025 11:17:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
To: Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <CAKYAXd8Nb6Ay1-J0GeDUCzRDWWYtRtcU-2FZ1LrX9p8soKpaKQ@mail.gmail.com>
 <bd2237e6-86e7-40c8-8635-8ba6c0573cbe@samba.org>
 <CAKYAXd8QhE_=zoK3pLqd0M-8Zw8M0auTw-P5yoqe6DioGXtsaQ@mail.gmail.com>
 <CAH2r5mv0BLnF9+ori1ZfoaYfBLXcscjuFkkAjggSY+aroKDRiw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAH2r5mv0BLnF9+ori1ZfoaYfBLXcscjuFkkAjggSY+aroKDRiw@mail.gmail.com>
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
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Paulo Alcantara <pc@manguebit.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 28.11.25 um 05:53 schrieb Steve French:
> On Thu, Nov 27, 2025 at 9:19 PM Namjae Jeon <linkinjeon@kernel.org> wrote:
> 
>> On Fri, Nov 28, 2025 at 12:54 AM Stefan Metzmacher <metze@samba.org>
>> wrote:
>>>
>>> Am 26.11.25 um 02:07 schrieb Namjae Jeon:
>>>> On Wed, Nov 26, 2025 at 8:50 AM Namjae Jeon <linkinjeon@kernel.org>
>> wrote:
>>>>>
>>>>> On Tue, Nov 25, 2025 at 11:22 PM Stefan Metzmacher <metze@samba.org>
>> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> here are some small cleanups for a problem Nanjae reported,
>>>>>> where two WARN_ON_ONCE(sc->status != ...) checks where triggered
>>>>>> by a Windows 11 client.
>>>>>>
>>>>>> The patches should relax the checks if an error happened before,
>>>>>> they are intended for 6.18 final, as far as I can see the
>>>>>> problem was introduced during the 6.18 cycle only.
>>>>>>
>>>>>> Given that v1 of this patchset produced a very useful WARN_ONCE()
>>>>>> message, I'd really propose to keep this for 6.18, also for the
>>>>>> client where the actual problem may not exists, but if they
>>>>>> exist, it will be useful to have the more useful messages
>>>>>> in 6.16 final.
>>>> Anyway, Applied this patch-set to #ksmbd-for-next-next.
>>>> Please check the below issue.
>>>
>>> Steve, can you move this into ksmbd-for-next?
>> Steve, There are more patches in ksmbd-for-next-next.
>> Please apply the following 6 patches in #ksmbd-for-next-next to
>> #ksmbd-for-next.
>>
>> 3858665313f1 (HEAD -> ksmbd-for-next-next, origin/ksmbd-for-next-next)
>> ksmbd: ipc: fix use-after-free in ipc_msg_send_request
>> b9c7d4fe6e93 smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
>> checks in recv_done() and smbd_conn_upcall()
>> 6c5ceb636d08 smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
>> checks in recv_done() and smb_direct_cm_handler()
>> d02a328304e5 smb: smbdirect: introduce
>> SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
>> 340255e842d5 smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
>> 01cba263d1bd ksmbd: vfs: fix race on m_flags in vfs_cache

It seems these are the v2 patches, please use v3,
the difference is that the __SMBDIRECT_SOCKET_DISCONNECT
defines are moved up in order to let the patches on top work
with out modifications. I noticed the difference while
doing a rebase on ksmbd-for-next and get conflicts.

Thanks!
metze


