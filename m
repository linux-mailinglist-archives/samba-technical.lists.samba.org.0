Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D04ACBD04
	for <lists+samba-technical@lfdr.de>; Tue,  3 Jun 2025 00:03:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LAb7MImkVB18Eikyu1yoO0C8MExd+ptBqbHzTsah6zQ=; b=AJWImpfVLilezDVRD+NmgHZumT
	eiZRNuuOm6LvJz5FydjWB//hh8ndZWOk4pNicwKaAUyIgVDXyjYrVGiBvtJ5pesvjQL1q/zizf/Wr
	lO/m2mfmIy8/Em1JxO2ozc6iDOUz2gMwUtB5ZOD+zXSW7QRf23Ttr1lCBtNBfTdcs6Ll1xIEvsmuX
	wx5J9R2agRLOnhEpwAWwUft25gARJiehO2kpUKUlLVHUDZJJaLxPeXGSlhlc8kBKtYXfVc94ZR+H+
	E4LSXIIclbiUCb/J+52qzgsD1azo5N9pPjACRu8j/5FJid5ve6rJWniN6FA1QIKQzbfcRsLQrSm71
	Kl2Hj4xQ==;
Received: from ip6-localhost ([::1]:33342 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uMDFG-006Smd-Jf; Mon, 02 Jun 2025 22:03:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48550) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uMDFC-006SmW-1Q
 for samba-technical@lists.samba.org; Mon, 02 Jun 2025 22:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=LAb7MImkVB18Eikyu1yoO0C8MExd+ptBqbHzTsah6zQ=; b=0L6PPdZNTrzn2i30wC8+hR2aDa
 joxXUXwEa0vWik8knnI1BBCpkZdiHmJisXFowrvSVIZLF5rF5XoxfQv/OKgTeaEZ6UtRxI9ribbrR
 bVQGavQvhEgunlVVPnJeDridtIcmjGykyb8fIxwpXCIIfs3oIPvAOmUvESBkAN2ClTixRxNjqhGdV
 9sAUVFjqyXwJttrU58QF5FL7xqqVwWNsxfVpzCSvIWDONve/YAXDBMjboK2Y163+UUikkbmtvG0ta
 +u39+jm68OFPLRS6WEJLkSx5ZUCYsyLCoRMk7qZwfqZA9Df4kmAz/nr2U4gnv9IGHvpFlPPnqaQia
 Ev6IiU0Cwp3Jp/ANAxqJF3Y5K52LqJg8aqMLlpBY38AlAc8u/gSfCauS0cpfUtpau6NN2d/cWbEY7
 M3Y5dWyvoMmFz8jwwIFOfyVt11snkDBnpv91OFOtl03LswPJJprGibpvD1eGhpLX/ycuw+NknnUgr
 G3k8UrSMn7g5X7oatlSxe9oe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uMDFB-008Ztr-0V; Mon, 02 Jun 2025 22:02:57 +0000
Message-ID: <5d0f7f91-8726-4707-abd4-c1898c8ba65c@samba.org>
Date: Tue, 3 Jun 2025 00:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] smb: smbdirect: add smbdirect_pdu.h with
 protocol definitions
To: Namjae Jeon <linkinjeon@kernel.org>, Steve French <smfrench@gmail.com>
References: <cover.1748446473.git.metze@samba.org>
 <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
 <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
 <096f20e9-3e59-4e80-8eeb-8a51f214c6f1@samba.org>
 <CAKYAXd86mLGAaAEUFcp1Vv+6p2O3MSJcwoor8MmjEypUo+Ofrg@mail.gmail.com>
 <CAH2r5mvQbL_R9wrFRHF9_3XwM3e-=2vK=i1uaSCk37-FZmJq9g@mail.gmail.com>
 <CAKYAXd9T81En40i3OigiTAmJabMr8yuCX9E1LT_JfaTmyefTag@mail.gmail.com>
 <CAH2r5mso54sXPcoJWDSU4E--XMH44wFY-cdww6_6yx5CxrFtdg@mail.gmail.com>
 <CAKYAXd_BVHPA8Jj6mtc_nsbby1HizZFEmCft20B_wcTM3pDUVg@mail.gmail.com>
 <CAH2r5mvygcy0-WwZNu6NvjXGrMtB5ZFLK7_w0rc6rVpaVDeBxA@mail.gmail.com>
 <CAKYAXd-4-WRw9bL-shqELhMO70fyznmeh0HByA=pyOcccu3sgg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAKYAXd-4-WRw9bL-shqELhMO70fyznmeh0HByA=pyOcccu3sgg@mail.gmail.com>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 02.06.25 um 04:19 schrieb Namjae Jeon:
> On Mon, Jun 2, 2025 at 10:57 AM Steve French <smfrench@gmail.com> wrote:
>>
>>> Can you explain why he has split it into smbdirect_socket.h?
>>
>> The three header names seem plausible, but would be useful to have
>> Metze's clarification/explanation:
>> - the "protocol" related header info for smbdirect goes in
>> smb/common/smbdirect/smbdirect_pdu.h   (we use similar name smb2pdu.h
>> for the smb2/smb3 protocol related wire definitions)
>> - smbdirect.h for internal smbdirect structure definitions
>> - smbdirect_socket.h for things related to exporting it as a socket
>> (since one of the goals is to make smbdirect useable by Samba
>> userspace tools)
> There is no need to do things in advance that are not yet concrete and
> may change later.

The current idea is to merge transport_tcp and transport_rdma into
transport_sock, see
https://git.samba.org/?p=metze/linux/wip.git;a=blob;f=fs/smb/server/transport_sock.c;hb=66714b6c0fc1eacbeb5b85d07524caa722fc19cf

Which uses this interface:
https://git.samba.org/?p=metze/linux/wip.git;a=blob;f=fs/smb/common/smbdirect/smbdirect.h;hb=66714b6c0fc1eacbeb5b85d07524caa722fc19cf

But note that is just the direction were it goes, that current code has a lot of resolved merge conflicts,
which may not work at all currently.

Instead of putting my current code I try to take the existing client and server
code and merge it, so that we don't have a flag day commit that switches to
completely new code. Instead I try to do tiny steps in that direction
and may end with an interface that is similar but might be a bit different in
some parts.

> He can just put these changes in his own queue and work on them.
> I am pointing out why he is trying to put unfinished things in the public queue.

Because I want to base the next steps on something that is already accepted.

I really don't want to work on it for weeks and then some review will void
that work completely and I can start again.

> If You want to apply it, Please do it only on cifs.ko. When it is
> properly implemented, I want to apply it to ksmbd.

I can keep the ksmbd patches rebased on top and send them again
each time to get more feedback.

Would that work for you?

The key for me is discuss patches first and have them reviewed early
so that the following work rely on. Any the tiny steps should
make it possible to do easy review and make it possible to test each
tiny step.

metze


