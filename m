Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D48897823B1
	for <lists+samba-technical@lfdr.de>; Mon, 21 Aug 2023 08:28:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=g9XIsdymZtIYScMKoP1khuLAGTXAvar2p7vK/JS0UAM=; b=5yYdp0OJzvrHxX8uX4ZyJK6+bU
	dGmyeoiw+Xffa55tlN99avF/evimEFVnvEBuQBuTEWb7aQbw+U4Y5Ky99A214dUqqGOC6FrSMa2pZ
	+MKJrYae6PoElY9rwBYQjpkNwy3cEmaJcW6+r0OYh8jO/1PHKEXre65KYi9RCNfQGoxmSGluLREK7
	LV3vmdMXHxrSHL10PqpJQ6pa5Rmzmnw9TRKaK0ARMg0XjY/KPXsQPgfyIZGy/y0stuM/Y8J5lhvEa
	oBLZjP5bxf61eW74BPU0xHqek/ZPoRIJSblr5LtJrlJiJoA4oho50NM+A9Byod4YFNQR78L461tP9
	rnKTy9pw==;
Received: from ip6-localhost ([::1]:30104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qXyOE-00DZdy-Us; Mon, 21 Aug 2023 06:27:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41544) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qXyO4-00DZdp-GV
 for samba-technical@lists.samba.org; Mon, 21 Aug 2023 06:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=g9XIsdymZtIYScMKoP1khuLAGTXAvar2p7vK/JS0UAM=; b=kpMF1VP4BKore8c4MtA/fOI/1f
 q7uBjMBlKRHYQwyYGq915HKlCS9K5OF/14G+Fvvzm3tAKW2l0TuXuld1FcRw297TQ9JVXhzjhfC23
 2ou3IO/APbVApiDWU0tH/cOpOMopaov+k48RfJnD0qI1DiSTn1/HJmuh1FLeSItrmqfn0C+FS8fFj
 KMepaIPLmOF55GdSnG6oQHDIto3cjPfl/sXyujbxG8cNyLr2bjD1s7JKHh9txlKfg344LiTFbMk9y
 pE6axHc5zoEwsBgNOnmSwE96JqIIctg5xvUNOFuyGQfoy8b1kZBZLjyZAkfiKWYcAUopbT8hAYUPT
 OdfTp/E/L8iheQrPW/rl0naUhlIHMxXnbxm75+NQPtWELL+sjaJP9mHcAvPBLrifKRtEpZ5zq/oYu
 Q+c8n6jQKihXAfL5VpE/ku6w0SApe9ZLYKHW6FRqgP/Epl5uRKQZIMQawYg8Lr6VIlUCwUTj8g0Lj
 lgOn262OUNJDvM5PtiKjG7dQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qXyO2-0098ks-0z; Mon, 21 Aug 2023 06:27:39 +0000
Message-ID: <72f992f5fc7615140a90629521f284b096578959.camel@samba.org>
Subject: Re: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
To: Pavel Kalugin <PKalugin@inno.tech>, samba-technical@lists.samba.org
Date: Mon, 21 Aug 2023 18:27:32 +1200
In-Reply-To: <62eadda8-c6d3-4086-8f64-c37a33824fa0@inno.tech>
References: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
 <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
 <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
 <14854277.O9o76ZdvQC@krikkit>
 <62eadda8-c6d3-4086-8f64-c37a33824fa0@inno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2023-08-21 at 08:48 +0300, Pavel Kalugin via samba-technical
wrote:
> On 8/19/23 21:06, Andreas Schneider via samba-technical wrote:
> > On Friday, 18 August 2023 02:08:00 CEST Andrew Bartlett via samba-
> > technical
> > wrote:
> > > I would note that times when we didn't line up the CI version and
> > > Python 'supported' version, it kept breaking.
> > > I note that RHEL7 ends 'maintenance' in June 2024, just after the
> > > 4.20
> > > release March 2024
> > > https://www.redhat.com/en/blog/end-maintenance-red-hat-enterprise-linux-7-al
> > > 
> > > most-here Those dates I think give good cause to drop CentOS 7,
> > > but other
> > > views still welcome.
> > 
> > I'm fine with dropping Python 3.6 support for Samba 4.20.
> 
> How will this affect OpenSUSE Leap users, where official python3 is 
> still python3.6?

This https://news.opensuse.org/2023/06/06/leap-modern-python-stack/
suggests that there is a python311 to install and the packages we need would be built for Python 3.11

Sadly that does not seem to be the case: 

sudo zypper --non-interactive install python311   python311-
Markdown     python311-cryptography     python311-devel     python311-
dnspython     python311-gpg     python311-
policycoreutils     python311-pyasn1     python311-python-
dateutil     python311-requests     python311-semanage     python311-
setproctitle
Loading repository data...
Reading installed packages...
Package 'python311-Markdown' not found.
Package 'python311-cryptography' not found.
Package 'python311-dnspython' not found.
Package 'python311-gpg' not found.
Package 'python311-policycoreutils' not found.
Package 'python311-pyasn1' not found.
Package 'python311-python-dateutil' not found.
Package 'python311-requests' not found.
Package 'python311-semanage' not found.
Package 'python311-setproctitle' not found.


This is much more troubling than the few (but critical) missing packages on CentOS 8 Stream:

https://gitlab.com/samba-team/samba/-/merge_requests/3231

So, and I am being over-dramatic here, this may be a case of Python 3.6 forever: as two major distributions blocking the upgrade.  

(I would naturally appreciate assistance in finding a solution here).

This is unfortunate.

Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions


