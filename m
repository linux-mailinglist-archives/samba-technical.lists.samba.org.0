Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 953EE4A66B9
	for <lists+samba-technical@lfdr.de>; Tue,  1 Feb 2022 21:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9HuensPuwQseU1qchjfF316urY7c5a9vIyOH5w1EfwI=; b=WwY9QNrmXMoBnWq0oL/Cu5xkGN
	EUexg87rzLIJ9RulCLnaryIkSsmJLGI7a2gSdPVkO3ABel9u3ZZ0RjKHJ13GUyRJy+VH3ldkLl59I
	lpiSH2WG1I/2sL+1swzAGe7J5xEl5FyT+ol2bES1z4vrLHltUoptrhouV2OQaN3NLfrH8FLt2syak
	0VtOvQcYFF7C7TTw7LHqydfLjE8mFHokhmempe78gdAiquv07QTuRw1m/xfZjDZ9aToO2Lg+Euf0z
	yke6XGqZS6wywM+FdmfxmIh57t/BwUiYUpspQk+27apPW4OloQ3GepxBG7Iv8A0+p9K+t8NJprQlz
	05EhO81Q==;
Received: from ip6-localhost ([::1]:63742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nF0Dy-004pOK-Lk; Tue, 01 Feb 2022 20:58:02 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:40829) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nF0Ds-004pO8-7G; Tue, 01 Feb 2022 20:57:58 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 23so54668761ybf.7;
 Tue, 01 Feb 2022 12:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9HuensPuwQseU1qchjfF316urY7c5a9vIyOH5w1EfwI=;
 b=GN3GBwJVe7e8BNsuqcjSu6erLSdMuIH18EkroD6+L7hJoI6A5AoCUhdZspsl/X0yrN
 wjaeIzhcZocizgiywNijzF984pXUGGIcoBN6HURhBEC+8rrbjqtYMRMHx57h7eQBcQzR
 jYNZeJ0yxJQO/OquAXaq96+H2VqMeQDxWipk9pEu4EiYUIAMiwrtSkvZDju//z6/8/pF
 p0+sksBoTq1Zu3VoPKplfAHplGAZtsACHliIsl5dkw9uutdKtYUncHSn/dRJgG5R5NP5
 nQYQiwNDzCxBT5okRgk5Y/cVfGy6AryVm2a0t7xRggJq2gXY/ilL4vjYDdfRAMPbn97F
 AMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9HuensPuwQseU1qchjfF316urY7c5a9vIyOH5w1EfwI=;
 b=XNKuwRoCWePhgjWV297f35ZOfcUV+CPUUIDW1I5LF2KHhM0qDDQcWR/Xu78HwFYTYu
 8my2uW07zn7COYQvYRoF7eQCeatfHbnvJ/I048E6kuMRSYLi6uW5QwUY6veYWIxVD8E7
 kIN8dxFZZ1gJd88JzS3q/C436aOHtian7eaZKTU6CUxMEBtu1jcq8Vy5cUXJ9Tuawjye
 V3NxD4NLZ9GJYT701s5b2U4mtp4mL9a88oUM46N3O//PwXY4B5PbU4wxHZdZ9b51GhGJ
 DpgnIbdqHq1UtDfBaPqmoapDrdzX/pwsOsYl2/UPkThiMKR+iDQ5sxZvxaCjWcZzV9/9
 YBRQ==
X-Gm-Message-State: AOAM531Wg7iiloG7C0YN+ENq8iDx1W2SZrBRWbZmrKmh9b8xr/vtomVU
 q+eLwVaU7QNSmATXSBhbOao61fAzW8dLA3p6BtE=
X-Google-Smtp-Source: ABdhPJwxkL8k6wzYIwO0IA8a4e0CA2Zp9oYFxLrIIeS4ZKcCICcKaogFmmqa6WTq6/ivA1Spz4b539jwWKfGDz5AWVU=
X-Received: by 2002:a05:6902:1508:: with SMTP id
 q8mr33941904ybu.738.1643749074223; 
 Tue, 01 Feb 2022 12:57:54 -0800 (PST)
MIME-Version: 1.0
References: <YfmYyVJIwDOzagUb@jeremy-acer>
In-Reply-To: <YfmYyVJIwDOzagUb@jeremy-acer>
Date: Wed, 2 Feb 2022 06:57:43 +1000
Message-ID: <CAN05THTOq-aVCbkUFejKo5AUfZmNoPNxMdXXSzAZYKtfc=Uzug@mail.gmail.com>
Subject: Re: SONOS finally adds support for SMB2/3
To: Jeremy Allison <jra@samba.org>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: samba@lists.samba.org,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Took them god damn long, but better late than never I guess.

FYI: Playstation2 has had support for SMB3.11 since several years.

On Wed, Feb 2, 2022 at 6:33 AM Jeremy Allison via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Release notes for their update are here:
>
> https://support.sonos.com/s/article/3521?language=en_US
>
> I have a lot of SONOS kit so this is good
> news (finally :-). Now, of course this is
> only for SONOSv2 devices, not V1, but that's
> understandable given the hardware restrictions
> on the units.
>
> The last real user of SMB1 is dead ! We can
> get on with removing it from Samba :-).
>
> Cheers,
>
> Jeremy Allison,
> Samba Team.
>

