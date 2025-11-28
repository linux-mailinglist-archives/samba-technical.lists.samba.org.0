Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FFDC92257
	for <lists+samba-technical@lfdr.de>; Fri, 28 Nov 2025 14:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=S7kIslra5oRThJMYs3BC9tPGj2u/C/aQAgSkpsIeH48=; b=xOdBGgKu3k9GTMwVkA+9SYpEIB
	I6+suea7IMMSVfFPSERu4WsY525+5U2fkckVZEcZds7EIxKjl1Jt8IpiGk6Q5nw7FSve0uBzxD+85
	udA3uckFgsBpG91kKA+4RRAmPjeqK9yP4KR0ijGf0NDl507JzDdTu1XBH4V8moNrJxWRSB3GkNOFV
	kfMTTMUfc6JJb8cg/Uu2JW1JpwdCkybk98Q7nSh7NyZ4Q+cH6+ITXo73OgdF0lW4G90PQJUmyNKl7
	Dj44JkBGyMDZL0cUd6T/RTY3KMS1UrZGd+exist2+1ca8RuIUBtkLnAuFLdBWnx1incbBR8xqXByW
	acQ2teqQ==;
Received: from ip6-localhost ([::1]:34406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOyd2-00DWbA-6O; Fri, 28 Nov 2025 13:35:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52316) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOycu-00DWb3-52
 for samba-technical@lists.samba.org; Fri, 28 Nov 2025 13:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=S7kIslra5oRThJMYs3BC9tPGj2u/C/aQAgSkpsIeH48=; b=1waGoaLnPs/kyqZ1p3NJAJQKnz
 rQl+gcxQ8o8tz7wy8tzWnhYfeXVCNArT/xIaEictEnDx7QmWJSJIfRHXg+HXti5S1qXDBTWzGR+dr
 c1z8jCbs0UgOnDEWPbSiy/imfNFpaooJI2bM/sBksrl6CZZcj/Jii808C+LwfeR7PSmrV6RJoERYU
 oTNdzjyMK/WqAhhHLgSwXVA31rcDoNqfClt4dDOSELBgXmRXT8JjW3AuglPuzWzLMIuCxqOToTTKu
 bwAa10ITdgEACQZNNOYNoit6ZuQrv1Z3W57dzlKCdbslJx0u0PLaYaUuJtnhpiftOso+K6iyS7lOB
 yOuf9bZiadwyme9C+QVWWLKRpcis6nW+aKfUfKZF0b4SWUh24pYGGNbAU2IFjHKAymjW+yWehiCxF
 clMVf4YYDPmLHrQufau6K9VrIfBxB4rAdI2LJgRnTnaP+3m7xAG11Dg629DcaVUDbv6nm45dxgPAP
 lw8lXxC8LXUrVcc3tS0Ej3M/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOyct-00G9An-09; Fri, 28 Nov 2025 13:35:07 +0000
Message-ID: <788d9b9e-e693-437f-bb56-1b84868b4250@samba.org>
Date: Fri, 28 Nov 2025 14:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
To: Namjae Jeon <linkinjeon@kernel.org>, Steve French <smfrench@gmail.com>
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <CAKYAXd8Nb6Ay1-J0GeDUCzRDWWYtRtcU-2FZ1LrX9p8soKpaKQ@mail.gmail.com>
 <bd2237e6-86e7-40c8-8635-8ba6c0573cbe@samba.org>
 <CAKYAXd8QhE_=zoK3pLqd0M-8Zw8M0auTw-P5yoqe6DioGXtsaQ@mail.gmail.com>
 <CAH2r5mv0BLnF9+ori1ZfoaYfBLXcscjuFkkAjggSY+aroKDRiw@mail.gmail.com>
 <b1f6271b-3c2a-493a-a404-7cdacd791acb@samba.org>
 <CAKYAXd9ykY7y0PGFcibQMUjQxb9_usEqKEJFrWJCBFuNesji1A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAKYAXd9ykY7y0PGFcibQMUjQxb9_usEqKEJFrWJCBFuNesji1A@mail.gmail.com>
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
Cc: linux-cifs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Paulo Alcantara <pc@manguebit.org>, samba-technical@lists.samba.org,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 28.11.25 um 13:11 schrieb Namjae Jeon:
> On Fri, Nov 28, 2025 at 7:17 PM Stefan Metzmacher <metze@samba.org> wrote:
>>
>> Am 28.11.25 um 05:53 schrieb Steve French:
>>> On Thu, Nov 27, 2025 at 9:19 PM Namjae Jeon <linkinjeon@kernel.org> wrote:
>>>
>>>> On Fri, Nov 28, 2025 at 12:54 AM Stefan Metzmacher <metze@samba.org>
>>>> wrote:
>>>>>
>>>>> Am 26.11.25 um 02:07 schrieb Namjae Jeon:
>>>>>> On Wed, Nov 26, 2025 at 8:50 AM Namjae Jeon <linkinjeon@kernel.org>
>>>> wrote:
>>>>>>>
>>>>>>> On Tue, Nov 25, 2025 at 11:22 PM Stefan Metzmacher <metze@samba.org>
>>>> wrote:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> here are some small cleanups for a problem Nanjae reported,
>>>>>>>> where two WARN_ON_ONCE(sc->status != ...) checks where triggered
>>>>>>>> by a Windows 11 client.
>>>>>>>>
>>>>>>>> The patches should relax the checks if an error happened before,
>>>>>>>> they are intended for 6.18 final, as far as I can see the
>>>>>>>> problem was introduced during the 6.18 cycle only.
>>>>>>>>
>>>>>>>> Given that v1 of this patchset produced a very useful WARN_ONCE()
>>>>>>>> message, I'd really propose to keep this for 6.18, also for the
>>>>>>>> client where the actual problem may not exists, but if they
>>>>>>>> exist, it will be useful to have the more useful messages
>>>>>>>> in 6.16 final.
>>>>>> Anyway, Applied this patch-set to #ksmbd-for-next-next.
>>>>>> Please check the below issue.
>>>>>
>>>>> Steve, can you move this into ksmbd-for-next?
>>>> Steve, There are more patches in ksmbd-for-next-next.
>>>> Please apply the following 6 patches in #ksmbd-for-next-next to
>>>> #ksmbd-for-next.
>>>>
>>>> 3858665313f1 (HEAD -> ksmbd-for-next-next, origin/ksmbd-for-next-next)
>>>> ksmbd: ipc: fix use-after-free in ipc_msg_send_request
>>>> b9c7d4fe6e93 smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
>>>> checks in recv_done() and smbd_conn_upcall()
>>>> 6c5ceb636d08 smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
>>>> checks in recv_done() and smb_direct_cm_handler()
>>>> d02a328304e5 smb: smbdirect: introduce
>>>> SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
>>>> 340255e842d5 smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
>>>> 01cba263d1bd ksmbd: vfs: fix race on m_flags in vfs_cache
>>
>> It seems these are the v2 patches, please use v3,
>> the difference is that the __SMBDIRECT_SOCKET_DISCONNECT
>> defines are moved up in order to let the patches on top work
>> with out modifications. I noticed the difference while
>> doing a rebase on ksmbd-for-next and get conflicts.
> Right, Sorry for missing v3 patches.
> 
> Steve, Please apply updated 4 patches in ksmbd-for-next-next to ksmbd-for-next.
> 
> fc86cca6087f (HEAD -> ksmbd-for-next-next, origin/ksmbd-for-next-next)
> smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
> recv_done() and smbd_conn_upcall()
> 111b7cb1b7f6 smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
> checks in recv_done() and smb_direct_cm_handler()
> 12059ee95a5b smb: smbdirect: introduce
> SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
> 3658d5ac7908 smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper

Given that we missed linux-next for this week anyway,
we could also add everything from my for-6.19/fs-smb-20251128-v5
branch, which is rebased on smfrench-smb3-kernel/ksmbd-for-next with
the top 3 commits replaced by the top 3 commits from
smfrench-smb3-kernel/ksmbd-for-next-next.
And has the patches from David's cifs-cleanup branch
as well as my smbdirect.ko patches.

metze

