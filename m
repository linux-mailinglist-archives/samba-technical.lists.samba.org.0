Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C570E8B5E3D
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 17:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=VS0xhk8Sj0vfhjIKNkiQIo1zm07drKZYVl551GJ+8sc=; b=xAbAh8iZQA2Iu+yXQfObOVN5XC
	3KFh6Wu/ul2k3Khbui8Vfqzuxw05dbHfk9/mAWMTA6WGAfmlvp5AuJlfGascMekr74WavbMZ3LxOn
	/FnEcvvX63q3o7soDzqdq/qta9zYaqK210VgWf1txVXvUvkDBjlUTn4m5pV8yaaXjGM3QbsAwZ4Se
	QzA/WrwwM87NGkqSZpWYQ/2BG+8rsZHX4yUa33ugGz+HXIdRLCuEeJHWWIDoKnivJignfbBH7e8j9
	tq2AsHcUA9aKCGdPuKzzMI2q6xh5xa+YJxZWLpSRDahIOxSlQhWD7EZaCMA8ElofZr7Ko70Pcw53S
	LnkuEAjQ==;
Received: from ip6-localhost ([::1]:33290 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1TN0-0060os-35; Mon, 29 Apr 2024 15:56:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42838) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1TMu-0060oj-G2
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 15:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=VS0xhk8Sj0vfhjIKNkiQIo1zm07drKZYVl551GJ+8sc=; b=Z8kjgqtsYFQlOy3DSY7c6j1oXz
 9PnHTqyAKWLnMBpY2FoEEZ5gM8B4eTaUhNh6nTnmDyf9v2pawOQpqzd0Z+3fpirEZJ9Js2TTwQAdB
 BHjDxM9ayZ18HzNd+wKOla2U5wHmA97W4I4zTF5u0RsCQbmg16epmXli2yScExdxgySjmFiCDvlYL
 QYMjbrQgykIVdRAsWV2dq6a0Ps9lU10f8mmvO2uwx9gfc1mvlWY2DIIzkKDmEB+QuxLXI+jzCT7Df
 DXS7Hb4dZqUk4oAlGg5ZhIvOvuIWNMWp3HibnEkfLb4+i0F4wc05qfUZtJBjvgIMckG5Y9H15KNSf
 P0Pv3sJmu9rX9aLq66dg/teP1c2+VIbnPnszX/mNb6eQVOsRT45YaRsj+HYZi/H+9lyVXGue3cRYi
 sessWMVmdLelT56UM3AHbhax4EBF2prY94fFpzjZMiICfnG2a2aUCG6/F44YIbgtzLtey17vgocmv
 fKLOOjBfDRRLDqGmsgiZdv1c;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1TMt-008xJS-33; Mon, 29 Apr 2024 15:56:40 +0000
Message-ID: <e8fc29a1-9ca4-4644-8ff0-32fbf1bfc390@samba.org>
Date: Mon, 29 Apr 2024 17:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Need to rebuild Rackspace gitlab runners - plan to move to Ubuntu
 24.04
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <e3375f71e0d24e109832046bfc46bdbfb1429855.camel@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <e3375f71e0d24e109832046bfc46bdbfb1429855.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 29.04.24 um 07:26 schrieb Andrew Bartlett via samba-technical:
> Just a heads up that due to
> https://bugzilla.samba.org/show_bug.cgi?id=15638 I need to rebuild the
> GitLab runners we have in Rackspace, so that it still offers a tag that
> our jobs will then expect.
> 
> While doing that, if the image is available by then (it isn't yet), I
> would like to make our runners run on Ubuntu 24.04 as the runners
> (which are booted once per job) will start faster as they won't have as
> many updates to run on first boot.
> 
> Please let me know if you think that could be a concern.  On the plus
> side it should allow the more recent kernel for some more io_uring
> testing.
> 
> Naturally I'll check a full private CI run passes before I rebuild for
> production.

Great! Thanks!

metze


