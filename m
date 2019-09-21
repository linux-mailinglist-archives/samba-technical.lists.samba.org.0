Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC9CB9D82
	for <lists+samba-technical@lfdr.de>; Sat, 21 Sep 2019 13:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JWt1IASd9oF0mgCyt/zQRwS7Xn2utBJAoi3D1m5FgXc=; b=OEi5TL9z9OzeMIWPqhBBfMT0Wx
	mWuwXbOKs6rhOoVzR0qdL4vBGhgk1k4ccSUOJ2EFyZVa2LX5N2lYZD0AlNQqLC0atFEmYx4tNjRF5
	lUaXAflNRfUCRbCugERP7JzTfdb2cCK0V5L578bv2uo8Wog59r3X+nFpSPnbCOyvry5dnBQCbTHQy
	3hpoa/VAQK57B4Qj5Q4gEIG+MuRN0MRmQyn281dqyicCK3+Dpmg2emC75evBTFkpqzH0Kmm2BS0nE
	KRW0NFebX4I2qv3pol3mLSH8ICg5WrB8f5+Ub3I9UbaPLyNykbNM9GfSL5iCRZojvvQLC7F1M4d4/
	8kLl0pug==;
Received: from localhost ([::1]:64432 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iBdBq-007P7t-FQ; Sat, 21 Sep 2019 11:04:34 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:46895) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iBdBl-007P7i-Da
 for samba-technical@lists.samba.org; Sat, 21 Sep 2019 11:04:31 +0000
Received: by mail-io1-xd41.google.com with SMTP id c6so8940185ioo.13
 for <samba-technical@lists.samba.org>; Sat, 21 Sep 2019 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JWt1IASd9oF0mgCyt/zQRwS7Xn2utBJAoi3D1m5FgXc=;
 b=EONTNvmzspA8GDk8wVeZRyMlo6P7thhQuHjG4ZM6VHHzMPHaQVnDGw/zmekZ+V9plP
 JtMQpCgTPie5ZYmVXNIi+yTasFxRWsiumsVkd7fH5EX21kMBI08IHgf8hZfVVWU0Bg15
 uslqySoq9ZV2arn8Os8IK6dBnVI3TtvzQ5OY849Mr6QrXX12GGOHmSQ78gB9w8hkmS+X
 Y9BKYhaNrHFZe7xHrfknKDIUafgqNPfRifFep9uAu0nkbZp3sV3d3pV6XRyra90MMqb3
 mv5Tt5YAo1irU78mYIWIDFfmHwkHVIDWnntW510Z3GRfx3WE54GZGgUhDGgt5n63r/Yz
 LaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JWt1IASd9oF0mgCyt/zQRwS7Xn2utBJAoi3D1m5FgXc=;
 b=k76mb3r1vkibY4086NlDDHzjJCDemiJZ3N4A4hpLrCPLjqeAUG/a0VqSH7F9tqYen+
 W0cdE08gU8Aume13s0W3JAr05ff8n3Od6SGlrVluDhBklzNu2l1BLa/v9rZhixhFxiOZ
 ndOqmtQ97G1Wz/QuDwyDsNYzG3EQYBUsjIfQeDdIrjmMeoKQGHyCH3QXZsV1Kxoui1+l
 1du3+iaaDH/hRt0/XJrSfejxUePRyQ2H5qcEWemHiBOh7PQ9BuU1/dliYKyHpaqVMboW
 8lY2m0WEFE0C99j9A0WPWFzRVtd8uGbeF9YWmU0Gf+x1h2n8CETAITZSr7rGhOo5n/Cw
 cG+Q==
X-Gm-Message-State: APjAAAXSEaQHjBl4B0UVY6JSlUeO9ut7ZjZV/BQdZpBMKw4cn75OjUTq
 rh0bUkVBRRXQoRtPYV6CzSvLqDN47fSfAFtq8RQ=
X-Google-Smtp-Source: APXvYqzKy2PW37yoPXK+m9YutDBZh0VmN/C63ia969R0SnpE/I2otkAjxhHSupUsFWZJHdwswH/ILzSMHAuHymPuWAg=
X-Received: by 2002:a6b:5f11:: with SMTP id t17mr3768051iob.169.1569063862753; 
 Sat, 21 Sep 2019 04:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvcRuSihH58GgrzXTAHuXnQ9a0N-d8AkLLOigQrqincKg@mail.gmail.com>
 <CAH2r5mvAw3ShBpy39OodU8EgXqR0rFBmAk0TXJbug1N22R8o4w@mail.gmail.com>
 <CAKywueQW84FxiG1QEmWSJdJiUAiVbYr+0hYVPc4ypW8OAtTZYQ@mail.gmail.com>
In-Reply-To: <CAKywueQW84FxiG1QEmWSJdJiUAiVbYr+0hYVPc4ypW8OAtTZYQ@mail.gmail.com>
Date: Sat, 21 Sep 2019 06:04:11 -0500
Message-ID: <CAH2r5mtpobejtzvmnE5fUhNfYvVRb8zgPEEm+aJu9HTzLmYVNA@mail.gmail.com>
Subject: Re: [SMB3][PATCH] dump encryption keys to allow wireshark debugging
 of encrypted
To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 20, 2019 at 12:14 PM Pavel Shilovsky
<pavel.shilovsky@gmail.com> wrote:
>
> Thanks, this is very useful functionality! A couple comments below.
>
> kernel patch:
>
> + cifs_dbg(VFS, "ioctl dumpkey\n"); /* BB REMOVEME */
>
> please remove this or change to FYI.

Good catch - removed and repushed

