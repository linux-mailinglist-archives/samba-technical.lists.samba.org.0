Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1BE16A3F4
	for <lists+samba-technical@lfdr.de>; Mon, 24 Feb 2020 11:33:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=iFLl0nVCvLFAfbqV9nvXUzL8GcKu9EB5Eybp69Fvn80=; b=enIYuv4w4yeXGgLzvThP9lUVxA
	W8MZsqXH6HMNIhTsdhSYwX5VwJh55g5xBIHoL2wcQzOr/VO9ULPBZ5Bc/gE+9ZExoD+Hk4N/g48b7
	CqHDOEoxlo2eLAtcn8NaONe46Z9LwFtRRAzGjA/NU+gfG8Ek07ny9cAw6lLOcnAPsKjJRr3NhEo0L
	sMTlVcxOEgrRiYxumUIH0lXGxuGpXYocwUGvfggBnfcnuubqoK7IebYkqIxUiwci3DpqvN952PUPI
	k7skQL1apKxmaimJKwwdXZeiLkMkdoKMbJYeeXYuMI/iNOsakI7b0PYoYz9xB+4v17Svomrb97Ti1
	ye27jsQQ==;
Received: from localhost ([::1]:19012 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6B3T-00BLgx-1l; Mon, 24 Feb 2020 10:33:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25232) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6B3O-00BLgq-L9
 for samba-technical@lists.samba.org; Mon, 24 Feb 2020 10:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=iFLl0nVCvLFAfbqV9nvXUzL8GcKu9EB5Eybp69Fvn80=; b=V4KX6oVddp7v8Vw7l2IjjHOT2W
 blbMBJbgoj+0bAY9f9Qz/HLkvamT9PJPygsHapiwNdjsTO7CNa4i1ag/SaU+id7bFJEzwOoLNfeIR
 ibUeIgeMDdzVnEzcLXuo/O7OL4ycOE7O9VCnZjSgj4Tfm+rC2DQp5IJyoG7Q3DswC+6rpmOrRnU0H
 +e/OU2aeVNSZpOIDZFCtcSkvYoNY4GOkLdx4mgBa94BZw2O0+Sjpn8HA+Ycb2THKzx/zIfE7Tm9T8
 9xCak3s53Jc/4BvwZA79pebQHN/zicKWwu/OPoPAoRBOqQ/q+jpKXYvt2/s8b2AX8guYNkt1Tk8Fv
 3QWVYNW2vCWfr2xrXuiSaZQIoEuv5tpCfqsweRqmloCZCQ5BVG9EOP5Ix8k31HXqElZNRk2AF20Do
 cLe7NaLjUiADPqd+45k7n5l2CBmGBZ4kYh3ingUVPUEbXIIv3HW+MWXsGGQGVotYGs2hzFyU2mj+s
 IIhw5dx0DKoVVxDDcQFkOnqs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6B3O-0004ZI-5v
 for samba-technical@lists.samba.org; Mon, 24 Feb 2020 10:33:34 +0000
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <CAC-fF8RQvdtcBjfZn+hg_HNeSpH+AmnZ=V5QFaT77=aTZ6qpBw@mail.gmail.com>
Message-ID: <544ea4ac-378e-1dc0-c576-5d974d3ead5f@samba.org>
Date: Mon, 24 Feb 2020 10:33:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAC-fF8RQvdtcBjfZn+hg_HNeSpH+AmnZ=V5QFaT77=aTZ6qpBw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

On 24/02/2020 10:24, Isaac Boukris via samba-technical wrote:
> Hi Dario
>
> Not sure related, but I noticed dns errors sometimes related to
> kerberos when forwradable is not set by default. Try looking in
> kerberos packet capture, and try adding "forwardable = true" to the
> libdefaults section of all krb5.conf files (including the one in
> private dir), see if it makes any difference.
>
Hi Isaac, I don't think this is going to help, I do not get this problem 
and have never had 'forwardable = true'

Rowland



