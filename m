Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 573335F2746
	for <lists+samba-technical@lfdr.de>; Mon,  3 Oct 2022 01:51:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=IN0FJxOTvYnfMwJbpqafUB444YxLy43/QnNHrkhud0U=; b=Cs4FkD5r5qz1jNK1o4f89sOU/K
	RwTZ9C/VYh/914BgW8kzIFYCyZcleo4pJIv+Nks6eHP0fnhAz1iawCEfswVj5yd7xuYklaqCUXbNv
	wjQMhCm29naEOrIS6CYg7RLKPsxDo2Q3AqEKvQZjkwlKw7QJSdC0rIbuIHbVDuBabQaXNGJiLrhZj
	ruvRBpt+giLooII3QoZdelyw7M/oJqmAmpK5Z90RZPZj4SDi4w4V/kToe6GbTMe1AGrBszIC9u6dT
	wAVfETm/rF6MEHlV75rariWlaVOxo1Pze1EHdUTaL1snnm+zNaBkPxmTpXYk7ngBnZAGy5Kd3FjRb
	MB4XI9Ag==;
Received: from ip6-localhost ([::1]:63486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1of8jP-007E3V-QV; Sun, 02 Oct 2022 23:50:48 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e]:44712) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1of8jD-007E3M-LA
 for samba-technical@lists.samba.org; Sun, 02 Oct 2022 23:50:41 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id s76so658508vke.11
 for <samba-technical@lists.samba.org>; Sun, 02 Oct 2022 16:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=KvNWKPgoOCEEbAuSFjBio+hcii3g5PZV9Qyu+fW1pmU=;
 b=ew3C6m5ESPb58q9ikQ3uuTMQtCBsRwpb3eAp+XyFYAoU48MF9X1ruAW71bfXSzVlCT
 SR8WdhNO4udhAz10NK+vialjCyu7H8/b+s3TZYUYpHvjikCcMRH/yb3OS+pKETCcTiQC
 MdI914gGQ/qTB3dNptDiTHrWiPGXfXPKMbIDQnbHRL3obRZSLqhMfNwquju8pTm1AsIQ
 CROXJKak7EZOgkCMEZPpXWtmqTzgkXu2bILpyxuEzJoYWQQR3W+GRRqEOjJ/nqElR6yI
 0NBYTM0rEdQL4oAnZS+xgW5+d4BFsMmSEo+ZEkrvg3ZLC95+TWlpuq7WxhSenVmJif6W
 jzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=KvNWKPgoOCEEbAuSFjBio+hcii3g5PZV9Qyu+fW1pmU=;
 b=MDxlUQ2D2LHU87xyZoLUiZ7xbk7QIrJPXp0QKXkzZYrpPtBfiF/aSAnSh87WDfPz21
 bykFbZUrC8QUyctnB4/vrh1quZ1NN4HEGGUp64UrfMgM8xOsLMixuBfJ8DQBtG2G+nkG
 2f7VKNYeT+tfhqK7mcHig/5PWGVkPRO5f1puEhnf2nTwkuCHflLpqGCiDVuk8lJIlD1d
 5FoT5DA8giwKslQdKYdrn36OXbtr7xG1yh45I9X4PQF3inQfHVIG+2W+5XcEX1J44l7S
 +ciOqDyQbliMYKT84ZXxcSyjfv2bSpZNJMlt2LOTRA8gdRS2ay5rRR6O7ALJyeVCEk0w
 HTOw==
X-Gm-Message-State: ACrzQf3hkYj8B1ykyrNheqb8h+4WieOeFeunumUUpYivqAtowFDmrvpk
 LISVfpah1ZTo9OnzewZSgmDvAkXEa18qACrjARw=
X-Google-Smtp-Source: AMsMyM72zR8CW4wlEDI8Z6EuPF+a0YfQVSxGvz+P+bpLMapwALWB6AyhewUHw8kSlUMqjs2SqxtqPijn1i7u7qVsKFY=
X-Received: by 2002:a1f:d583:0:b0:3aa:9112:570f with SMTP id
 m125-20020a1fd583000000b003aa9112570fmr72356vkg.3.1664754625488; Sun, 02 Oct
 2022 16:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvM6a4dU3d7Mxer9jWP0xkA2hyF9PrkwreES5T11W9O9w@mail.gmail.com>
 <CAH2r5mtoZRrCY-jDCH72DSNXPMxYiu24cuRRguLyXDx6zKUvwg@mail.gmail.com>
 <2734eb6f-cc01-cb0a-433d-e97729ce2aee@talpey.com>
In-Reply-To: <2734eb6f-cc01-cb0a-433d-e97729ce2aee@talpey.com>
Date: Sun, 2 Oct 2022 19:50:15 -0400
Message-ID: <CAH2r5msfNY87=5eNbTWpEQA47TnrbNA2OAnqw03JPPfHh7p+ug@mail.gmail.com>
Subject: Re: new SMB3.1.1 create contexts
To: Tom Talpey <tom@talpey.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I wanted to add the missing context # first and then wanted to add the
details for at least the Mac one so I could use it in some cases

On Sun, Oct 2, 2022, 14:27 Tom Talpey <tom@talpey.com> wrote:

> On 10/2/2022 12:01 AM, Steve French wrote:
> > patch attached to add the four missing create context IDs to the kernel
>
> These don't seem very important, to me. The APP_INSTANCE ones are
> about clustered clients where VMs may want to migrate around the
> cluster and not lose their VHDs. The OPEN_DEVICE_CONTEXT is about
> MS-RSVD. Neither of these are in Linux?
>
> The AAPL one is all about MacOS behaviors. If this is being added,
> it needs additional documentation of the parameter block, no?
>
> Tom.
>
> > On Sat, Oct 1, 2022 at 6:50 PM Steve French <smfrench@gmail.com> wrote:
> >>
> >> Noticed a few SMB3.1.1 create contexts missing from the Linux kernel
> >> code.  Any more beyond these four that are still missing?
> >>
> >> diff --git a/fs/smbfs_common/smb2pdu.h b/fs/smbfs_common/smb2pdu.h
> >> index 2cab413fffee..7d605db3bb3b 100644
> >> --- a/fs/smbfs_common/smb2pdu.h
> >> +++ b/fs/smbfs_common/smb2pdu.h
> >> @@ -1101,7 +1101,11 @@ struct smb2_change_notify_rsp {
> >>   #define SMB2_CREATE_REQUEST_LEASE              "RqLs"
> >>   #define SMB2_CREATE_DURABLE_HANDLE_REQUEST_V2  "DH2Q"
> >>   #define SMB2_CREATE_DURABLE_HANDLE_RECONNECT_V2        "DH2C"
> >> -#define SMB2_CREATE_TAG_POSIX
> >> "\x93\xAD\x25\x50\x9C\xB4\x11\xE7\xB4\x23\x83\xDE\x96\x8B\xCD\x7C"
> >> +#define SMB2_CREATE_TAG_POSIX
> >> "\x93\xAD\x25\x50\x9C\xB4\x11\xE7\xB4\x23\x83\xDE\x96\x8B\xCD\x7C"
> >> +#define SMB2_CREATE_APP_INSTANCE_ID
> >> "\x45\xBC\xA6\x6A\xEF\xA7\xF7\x4A\x90\x08\xFA\x46\x2E\x14\x4D\x74"
> >> +#define SMB2_CREATE_APP_INSTANCE_VERSION
> >> "\xB9\x82\xD0\xB7\x3B\x56\x07\x4F\xA0\x7B\x52\x4A\x81\x16\xA0\x10"
> >> +#define SVHDX_OPEN_DEVICE_CONTEXT
> >> "\x9C\xCB\xCF\x9E\x04\xC1\xE6\x43\x98\x0E\x15\x8D\xA1\xF6\xEC\x83"
> >> +#define SMB2_CREATE_TAG_AAPL                   "AAPL"
> >>
> >>
> >> --
> >> Thanks,
> >>
> >> Steve
> >
> >
> >
>
