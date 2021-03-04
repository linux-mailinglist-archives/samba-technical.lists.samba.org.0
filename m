Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5932D76B
	for <lists+samba-technical@lfdr.de>; Thu,  4 Mar 2021 17:09:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cwi43Axm90RClke0QtizDJHx1OcoGwhPeApsAmqRtXQ=; b=MdxZo3a+oI17s5Osmy1RTUvKws
	FQKseA/7mkQ/tpYTc7S9iA3LuIVIFr1rOy+Mn2pbtw1MdDXt3e5ooT68PyP28QE882PtsaEUru01G
	VkZc6ulid1LTH/EuG1ajnXJCSYOBzJGq+BHGwPTKG47L5YBbl6RaOf+swaeJuMgTuhQLqx5+Rzp6Y
	7hSP5YTSuZiFbhMEW73cF8ycCZlgsjm1OmyGlaXC10emP1QiA58G8GI45efp1wVHk+pCDSU6mCI/d
	ZJWVivq7qosfUfNu2yecN9EA3ALrjoVu0+knxaPRkoLzDAZmMzNE87P9QbcQOFu9ak62X15lpAz0K
	c8FK8wwQ==;
Received: from ip6-localhost ([::1]:37044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lHqWy-004B3M-Hs; Thu, 04 Mar 2021 16:08:52 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40064) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lHqWr-004B3F-VO
 for samba-technical@lists.samba.org; Thu, 04 Mar 2021 16:08:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id ci14so31382319ejc.7
 for <samba-technical@lists.samba.org>; Thu, 04 Mar 2021 08:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L58HTvlYkXEpoPWMTiLPG/YVQyEp6RlM2Cz3mN3l9F0=;
 b=QRhXHXbYYm7P5cdh4RqaegfLO+7FXCb3ylgoJ5BfG+BCqad8B/BLfk5Q9P0bipgHZF
 L7srgLBTw+fNHJP3RcoUYp+KbVOZDWuAOUK+QJf55bvzYmprNPIHpznd9GyJ84DhsPxB
 nljjCG2F23dyGgqLgz8wZE3r68LWCmP1Shr1LylRygDw5lFW3vBCmxtN1dqbdHEuc+qZ
 HcjYtKdZBpt05i6oHEfc1dPY7uZofuKoSZzy928v5Inko9rYv6NTy78cH6NrE3IxZ/Ll
 vJNzq79xGuXJLksiJ4V8PAGiNIqdiAv2UexZjEBYCrdyUkHcI/W6qKSyzxEPiuuklDjT
 9D8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L58HTvlYkXEpoPWMTiLPG/YVQyEp6RlM2Cz3mN3l9F0=;
 b=VpLtWMwYglE17AhkMT2oIPT8hQVZe/afPXLsWmSkj7Cf8WkMfzgBVXGnNBFxTLe60p
 H8MRF9n6ldB4lRH21kcWGkfBnI4M8CL0dy+KsnmDE1xOPu7wHT4rAKjIB3TsFzwI+Eq6
 lhdKYtRL5JBVuRxVwgJtposhOvCUOO/4k7ETx0/hpkrFH5B5AXk0pYDjjMQHsGpWvd5I
 feYIVYTLMegymKPUR0eaEivzJHRGwUL1S4B4LsBHb0jR2Bs1DGM0//V1Rx4l/OpBRzde
 6xbA8/r6i0V4f8HldohJxaPkWdUftg36JbVte1tyaZhx58dEeTybj+vUutvWa5kpjdaL
 IdfQ==
X-Gm-Message-State: AOAM53309DdYemH5zWYT2Jwg6lKGEL6cQ1/wuZmVrFLacmGyuUIic7q/
 VWxi5o8zT6Dv22zrI0ZWEAv+TB8Agk8K9T4TjUjTvA==
X-Google-Smtp-Source: ABdhPJx0xAhpbgMsOKc36AkXe3u2quBYXHhcc4HvsHYEGECo7mJi8WR7wLpoMgEMAp3in0V0iSeHrEvYe4R3hcCMBCM=
X-Received: by 2002:a17:906:719b:: with SMTP id
 h27mr5033553ejk.123.1614874120120; 
 Thu, 04 Mar 2021 08:08:40 -0800 (PST)
MIME-Version: 1.0
References: <65d1ab99-7c0b-1fa0-b42e-bce947d9295a@talpey.com>
 <3868fb70-aba6-bb75-f831-7bff958d0ebc@samba.org>
 <4b9a8546-4be1-edb9-afc4-84798b20fba1@talpey.com>
 <b40f0b6a-4c33-f9c6-8cf3-6124e952467f@talpey.com>
 <CAB5c7xr4Kr3f7v7rxP14La3QS7SL8FK_SyovqeMcevhssgjXsQ@mail.gmail.com>
 <407eb1b6-d840-d21a-0b03-0d9b1c82a045@talpey.com>
 <CAB5c7xo26nKs+tDEpfzLGGCBsqOK9you5_gLj5P_15NtCvbD5A@mail.gmail.com>
In-Reply-To: <CAB5c7xo26nKs+tDEpfzLGGCBsqOK9you5_gLj5P_15NtCvbD5A@mail.gmail.com>
Date: Thu, 4 Mar 2021 11:08:29 -0500
Message-ID: <CAB5c7xqFtGe1DrbT7yP0YVdRzBAV=xDN_KtuOiM9w7N8Og1TVg@mail.gmail.com>
Subject: Re: TimeMachine support for Big Sur - missing F_FULLFSYNC?
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

If you become morbidly curious about details of this, you can look at
module/os/linux/zfs/zpl_xattr.c in the openzfs repo on github. The top of
the file contains a rather lengthy explanation of xattr implementation on
ZFS.
