Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E202561B94
	for <lists+samba-technical@lfdr.de>; Mon,  8 Jul 2019 10:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=KnZs0zThUoHNAfkadNdwpcqLhdWw6UK4XDWz735RnB0=; b=LICTW114nZD1lhkI8nkRZi16MP
	DDqoOV5xAntmL0UR0qKAKHsYKroHcSuBoeDmojA5LToB+iyMz7VgCuyh7a2wqJY8MIv/zcscVVfe9
	2q1VteNenC6l8SV5eoBWVvKX3Ket09LOvhBzh1yBSshuHfuTqjUABr9FwJQ6APf3Xj52W09v0m6aP
	LAbQNA9jjoA/iFsf5YPNKpepEIKW99imUC/hAI8Yiaz6vNfkxZ24WqizN06Fo66W85sA3kTE2vYQQ
	zi0+jBm8dInPJNdEYJkGg6NxKSgWsVwQlojp2K6gb98OQQiR/j4idoja0L9BlG1KXKw08m5M9+TB/
	opwqrLtQ==;
Received: from localhost ([::1]:45978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hkOmP-005p1Z-Ct; Mon, 08 Jul 2019 08:13:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56546) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkOmK-005p1S-MX
 for samba-technical@lists.samba.org; Mon, 08 Jul 2019 08:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=n16L7iRFqfHc4ckEU+4JhI+hdFegPi2+8jYZuvlfeug=; b=JZslT+vzpWHU6O0W2ZhCVtwrPq
 QyHrzG92j5qA3UF7ryxuzpGRkPK3AZ+zKhP/c5vAsnpCYnlJOBxUW1eUriR3vvSYff9z+HpDwhCN9
 TiBUZY8WdnDuegOEJCfi6FDcv+h9FBramzxB2LWzNVARbE27oOwae5BXsQxWzPQN70O8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkOmK-00055I-9H
 for samba-technical@lists.samba.org; Mon, 08 Jul 2019 08:13:40 +0000
Subject: Re: samba | Samba-tool: add rfc2307 attributes to an existing user or
 group (!602)
References: <reply-e96467d609d32b58b3fd44217998eb3f@gitlab.com>
 <merge_request_32588795@gitlab.com>
 <a7ae114ef6068d101f197e06a502a1b7@gitlab.com>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <76eb2d8e-00c2-a353-39d3-c0367c66e2d6@samba.org>
Date: Mon, 8 Jul 2019 09:13:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <a7ae114ef6068d101f197e06a502a1b7@gitlab.com>
Content-Language: en-GB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 04/07/2019 05:41, Rowland Penny wrote:
> GitLab
>
> Merge Request !602 
> <https://gitlab.com/samba-team/samba/merge_requests/602> can no longer 
> be merged due to conflict.
>
> —
> Reply to this email directly or view it on GitLab 
> <https://gitlab.com/samba-team/samba/merge_requests/602>.
> You're receiving this email because of your account on gitlab.com. If 
> you'd like to receive fewer emails, you can unsubscribe 
> <https://gitlab.com/sent_notifications/e96467d609d32b58b3fd44217998eb3f/unsubscribe> 
> from this thread or adjust your notification settings.
>
Hi, can somebody have a look at this before I have to rebase it again

Rowland


