Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD10C8ACE7
	for <lists+samba-technical@lfdr.de>; Wed, 26 Nov 2025 17:03:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kHoyiQwUTzWQKihuxwrE7MsLoLeulN1ryAICzfbKsfQ=; b=VL+/zXBfIDdbWNxvECxlcgjqt7
	h54jmYLXJObc7zTLr/dpgMkTbCNaun73YRxEmrILixOyE0jR5Vphe4yAoERhyxIP9UezYMkh9c4im
	ANybJPz5u2Y4xd2ESYc8/YXBkP2of9143V2fcpPFZYyFdPRV02bEB55T0vPL/aaRPIbE4/mk8IhQn
	J3Hf2waeEJdzlGsEZCVZDNB1vpnqIHLcdEu/nA4febLgu1wVZ4dM1V6ZqfkV+l5ZpWK3F3Qq7IMln
	N8v0JAPbdqkKrDfqzbAlNsJubGdy1rAbEUArF62Bn4oOn6KOj6P5rVJqdViXGzEE2QZ4J5dozC+oY
	rTbWBtGQ==;
Received: from ip6-localhost ([::1]:18524 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOHzQ-00DOPc-Uq; Wed, 26 Nov 2025 16:03:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14560) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOHzI-00DOOw-W3
 for samba-technical@lists.samba.org; Wed, 26 Nov 2025 16:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=kHoyiQwUTzWQKihuxwrE7MsLoLeulN1ryAICzfbKsfQ=; b=xkatiZ2CuLawXdj/V0+CWISWxF
 +C9CD6hj8plU5w3nXImCMjirNRBbre2X189TIgAVJxSrmkIP8w8yRZNgb+9bxAimFjbf7Sdbj4EeN
 bSNAxxAQtgr9cjPPPmDK4L7so5rz+aUmuLZ5eIPIQHtgnhL9xMUcbAntlzj/9aKn9D5069gVtMLyq
 7Ikb0M6JB3YdRoBnnYdGf3QOIaimfeIZ+H88+QtWKLioZ1rQ4cxKgeM/YF+TQ0fgxxhSpJCtBuB91
 xPEbEMZZ8ELhlMP/Ry+LBUlaIsFLPrtdJwKJwaaeP26VzqTa2dumj6DBE/tw/fNN5H8sHMqM1JFHz
 /xC1xNOpYHlwhI/UHSx+gkgwgGeJHRncImwXDEAD44OtP6NxZDd4+Yk2KLlH2LIP/rAC2ympQJvMu
 si8sS5LKbjYvNFCIlyLWBDaF8XowNUSfxDZJpMxvX5eG8Hwhj3wF8AyDszhIZxAM7mA4yOOFHERk4
 PQtC1VP75eYmvOiHQ/ZQrqL2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOHzE-00FrnC-0m; Wed, 26 Nov 2025 16:03:20 +0000
Message-ID: <ad3feff5-553d-4d98-b702-9c7a594dd7c0@samba.org>
Date: Wed, 26 Nov 2025 17:03:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
To: Namjae Jeon <linkinjeon@kernel.org>
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <2786ee25-b543-48a8-8fff-e6c7ff341774@samba.org>
 <CAKYAXd8N-j8K1CUUH9_+wXpEZBo5i=K=ywkQPjJmmo76JbmXng@mail.gmail.com>
 <bd457989-d73e-4098-b3f7-c6871f49d188@samba.org>
Content-Language: en-US
In-Reply-To: <bd457989-d73e-4098-b3f7-c6871f49d188@samba.org>
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
 samba-technical@lists.samba.org, Paulo Alcantara <pc@manguebit.org>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 26.11.25 um 16:18 schrieb Stefan Metzmacher via samba-technical:
> Am 26.11.25 um 16:17 schrieb Namjae Jeon:
>> On Wed, Nov 26, 2025 at 4:16 PM Stefan Metzmacher <metze@samba.org> wrote:
>>>
>>> Am 26.11.25 um 00:50 schrieb Namjae Jeon:
>>>> On Tue, Nov 25, 2025 at 11:22 PM Stefan Metzmacher <metze@samba.org> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> here are some small cleanups for a problem Nanjae reported,
>>>>> where two WARN_ON_ONCE(sc->status != ...) checks where triggered
>>>>> by a Windows 11 client.
>>>>>
>>>>> The patches should relax the checks if an error happened before,
>>>>> they are intended for 6.18 final, as far as I can see the
>>>>> problem was introduced during the 6.18 cycle only.
>>>>>
>>>>> Given that v1 of this patchset produced a very useful WARN_ONCE()
>>>>> message, I'd really propose to keep this for 6.18, also for the
>>>>> client where the actual problem may not exists, but if they
>>>>> exist, it will be useful to have the more useful messages
>>>>> in 6.16 final.
>>>> First, the warning message has been improved. Thanks.
>>>> However, when copying a 6-7GB file on a Windows client, the following
>>>> error occurs. These error messages did not occur when testing with the
>>>> older ksmbd rdma(https://github.com/namjaejeon/ksmbd).
>>>
>>> With transport_rdma.* from restored from 6.17?
>> I just tested it and this issue does not occur on ksmbd rdma of the 6.17 kernel.
> 
> 6.17 or just transport_rdma.* from 6.17, but the rest from 6.18?
> 

Can you also test with 6.17 + fad988a2158d743da7971884b93482a73735b25e
Maybe that changed things in order to let RDMA READs fail or cause a
disconnect.

Otherwise I'd suggest to test the following commits in order
to find where the problem was introduced:
177368b9924314bde7d2ea6dc93de0d9ba728b61

After this it gets more tricky.

metze




