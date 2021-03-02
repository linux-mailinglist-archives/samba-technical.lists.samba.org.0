Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C201B329EDB
	for <lists+samba-technical@lfdr.de>; Tue,  2 Mar 2021 13:41:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OhTU4KMghyYpJBXY3SKD6npUBCDtt1q6PE0HqbWgbwg=; b=uRkt8fTDOlHYmQPPvpzzsyVxY8
	EUUiQw134raBJinAokeJzcA4PZNjNf68GHuM+z11KSPGK7zMUKyiHDpGJsB6stSsCoS7Fuz2CxCqC
	bXi94O8jPCajCnOFEHH9yvbC7p13ro+3seaNvTZ7IGphbF7TEDlO3NA2L2+COeRy3uLi1rtD/fXKO
	pXQdMm7igqUifzTTVlmxC30FmfarxXJwAxsrDqFZ2Sv9b4RXXXA+plPVg/XBr1J8f+RdF88WbDZBc
	7VRz+ahkCH+bQjojiOzDRGnHzfdVInS3P0/yy96TAAtkCXOmTTefXLGGukNREobVlqYBvp2gbdxpp
	Or5jOE5w==;
Received: from ip6-localhost ([::1]:27168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lH4KR-003qns-Mc; Tue, 02 Mar 2021 12:40:43 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:38081) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lH4KM-003qnl-AQ
 for samba-technical@lists.samba.org; Tue, 02 Mar 2021 12:40:40 +0000
Received: by mail-lf1-x129.google.com with SMTP id m22so31054705lfg.5
 for <samba-technical@lists.samba.org>; Tue, 02 Mar 2021 04:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6r675lV5/WgvoWv7gA0+NrFr3xB5Gp9Pr+jTkzOghIk=;
 b=EVCLHN8jh81/P4wpiS7uyy4LgQvRAdiJa0tkRfAhd79R3X6LGp/HshKa97T9L7n7ZD
 S6wLK9DiuP/HjoVoUzpUzeLNT+CJy9FZa5IpmzioVtac9EC+WeYgP+xuj/aEfu9E0mxz
 mhY8bQCf9K5OJb5ymu5T5vhRdiTaa47HO+LTYiVqxjaJhXGAzUBuHbzrSUpHD2nVdZcQ
 mJ8wffDBwPHIeUtZkPCVPAzFRidi4r2J8OYhmyODPeluezD0e4wcn7rmHwVc7vW71X7F
 snKajzxP06ONstWL4FbGygvU029krR5tzGmjDaNpryLJ6dC5I1NPaEoRMiv7IAunbFSd
 2ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6r675lV5/WgvoWv7gA0+NrFr3xB5Gp9Pr+jTkzOghIk=;
 b=AUQO2CBkmfbQNElQIuUfYCvrr6gB7HMhsKWXZhtpWT5TnBwyHmANpassFYbJ3mkwys
 mMYTrmaXcs4Qhcc3TUwbEAMJn5m+0DZFmmYfsqwo0IAr43ah2WxyaChthRuswSxAlHjN
 S36WB+jvkiWo5kJmeYIO53LdwqAPYvKPw472ooP13OK5Evhm8qdskEZObQIGqerdV43h
 zBHoEPG/xq35Zkvy1K7AGPZPSiWgknKmWlppjqQgUeC/BXABhXikOim3T/vgbYE2L9R2
 quhUhHsysfIQfOs4slRBWxnesotfoVwFIfW3l9WB520qTaAbNp7d+lyxaqYkXuwtkiV4
 3ouw==
X-Gm-Message-State: AOAM5331Oz0A5MhFNCZaQIfzIQsF4DVzWGsQB7afp9+ZuLT5ofGx8JLu
 dNoTUgf0KjPmvto0t0bn8I0giDV3vNbn2tSly9o=
X-Google-Smtp-Source: ABdhPJzNW2tIuIxf9th2ZiC60F0TioFGLcOT7dBHtowH1EIk4Xl2hImlWhSnppSwCkYD0CQMjR32/gB3XjDYuzXvmKg=
X-Received: by 2002:a05:6512:524:: with SMTP id
 o4mr12855138lfc.544.1614688835298; 
 Tue, 02 Mar 2021 04:40:35 -0800 (PST)
MIME-Version: 1.0
References: <CAH_vq2Hx+RzJoudmxcECe0PXG7uGvydzJceWm2nMEX0C5naV6w@mail.gmail.com>
 <20210224182956.GC1333267@jeremy-acer>
 <CAH_vq2HzC9T8FNc7khndkPa_uOTxOh9B94sU7TiN5zn0G3Ssmw@mail.gmail.com>
In-Reply-To: <CAH_vq2HzC9T8FNc7khndkPa_uOTxOh9B94sU7TiN5zn0G3Ssmw@mail.gmail.com>
Date: Tue, 2 Mar 2021 18:10:22 +0530
Message-ID: <CAH_vq2GPk+tKkc2UWLYPA1KyW5j7KjWbg373jNi8397a2n=wVw@mail.gmail.com>
Subject: Re: Kerberos Constrained Delegation in libsmbclient
To: Jeremy Allison <jra@samba.org>
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
From: Vikram Bharti via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vikram Bharti <vikrambharti33@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Any further help would be appreciated.

On Thu, Feb 25, 2021 at 5:28 PM Vikram Bharti <vikrambharti33@gmail.com>
wrote:

> IMO KCD can take service user, password/keytab-file, UPN of impersonation
> user, and SPN of service as inputs  (probably in auth_callback)
> or it can take final service ticket (TGS-REP) as input in auth_callback.
> Not so sure what should be right the way but I leave it up to you decide if
> these 2 are feasible or if there is a better way.
>
>
>
> On Thu, Feb 25, 2021 at 12:00 AM Jeremy Allison <jra@samba.org> wrote:
>
>> On Wed, Feb 24, 2021 at 05:29:37PM +0530, Vikram Bharti via
>> samba-technical wrote:
>> >Hi ,
>> >
>> >I was exploring a way to get KCD work with libsmbclient APIs and i see
>> >libsmbclient supports Kerberos auth but can't find any API for
>> >impersonation and delegation.
>> >Pls let me know if there is a way to get it done.
>>
>> No, this is not currently available in the libsmbclient API's.
>>
>> Can you give an example of what you'd like this to look like,
>> so we can assess how hard it would be to implement ?
>>
>
