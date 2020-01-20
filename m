Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCA0143460
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 00:10:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=qPapB/uaeQRHM9jnI/2YLFHHnH9zZL7WcS6fd4Tx4EU=; b=KUke3KAoOr9VgqD/cvX87L/xJ7
	n4x+iqnuyMvG6TkCWEL1G3BJY8Pd42DO7ehmok4IR+PwIbJoWrvFhR1ls3VYGVWRyLUeYF4cDQg9d
	2WD9yncjFFF/kYrZJGq7ffmXD78DPFaZDIKy+SM7rWjbYUoV4Ei4FbHkeTCuAhzDmvA9PfzZYEgs4
	k24j9W4wkDgGaaLLK1EMWc6glyRV0KJ4/ium3Q2Egr1BKUs1hFF2KAqrVbfmVFenQTf+Xn2UrLbaJ
	1+2girifp0m/dGVwohF8yFv56QAIhi+zDD+j6r0DorwBnRVdzkea3vHCjZ4TpG9y9FeRD8vEDrQeW
	HgCru4XA==;
Received: from localhost ([::1]:38592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itgBe-003xT2-1O; Mon, 20 Jan 2020 23:10:26 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:56894) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itgBZ-003xSv-1U
 for samba-technical@lists.samba.org; Mon, 20 Jan 2020 23:10:24 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id F2C3F80F14
 for <samba-technical@lists.samba.org>; Tue, 21 Jan 2020 12:10:11 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1579561812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPapB/uaeQRHM9jnI/2YLFHHnH9zZL7WcS6fd4Tx4EU=;
 b=orKymR1AnrQ1KbHJ4zftDBbt7FRICUT1+fsdD6m1bWYVGWNXAjh6pfUZ+vYhUE8owgcTI1
 wTPimtq+p968Dv6+5tGcNzN4eJYUNRIpT1WpBKw3TQASJRLJIFW8wbO+jV3UO+mJgU3NR4
 bI3b+bJo56qRuLO0I9mC9Oerc8FTNaYC+9C7fW5PM7ArkIL8HDKhyTgCkwjs32dC93Jts5
 Wovpvia1IDJL2l/eJbMStrAjuMp7XbknF5mJUNe8GQTpgWu+9M2IWMqIOQyctzPzbkDCCl
 zfwv9vfF+5n7dwLRSOaYR76yGTiTrRxU48Gw9p9t2UfYhPXDB5DOIYpBuo+Ewg==
Subject: Re: Update gpo.py
To: samba-technical@lists.samba.org
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-123@samba.org>
 <E1itg2D-00FjZ0-Bk@hr3.samba.org>
Message-ID: <7d1d01c1-6282-2757-9f8a-68960052e757@catalyst.net.nz>
Date: Tue, 21 Jan 2020 12:10:10 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <E1itg2D-00FjZ0-Bk@hr3.samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

While we're on the subject of github, this one:

> https://github.com/samba-team/samba/pull/123#issuecomment-576454831
and https://github.com/samba-team/samba/pull/53
and perhaps #191 and some others can be closed.

Could someone with github closing permissions look?

Then we will be down to single digit pull-requests.

Douglas

