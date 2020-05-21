Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5471DD90E
	for <lists+samba-technical@lfdr.de>; Thu, 21 May 2020 23:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4PGJLbq3Wq4EWQQLvIpUsHuLshmRr6hCLAiVNGgNUwo=; b=ppa/zsHJXmRfpPT88HUjVfA2vL
	zEG9pEKTiVPdJ2tWXeHj/yMYEmvX8hs7BOrLo25FJLavUL8Qvn52p//XVU8a81MsUlad0RaK1YEJJ
	kAE/0QnLKFxyweU5CkcTNubUu9M/qJSGQ5KjRpk9XlY8PyypmBIfoFttjBeZX1QuYqhymeHQg+uhY
	JQqpQBmYHU0ZjEfdj8rdXXP5eMbU/wccus9ZtR1kH3buoUpIpnrUjHu3yoJCI2FC1H43h5I0AVZVt
	sqg1qoUH7iJU1UPgY3Qr6O8CrLLofd48s2aStVHkoHra5adYlveQro/o1YfFukrGdY9bCHlu1JReQ
	huwRx7cg==;
Received: from localhost ([::1]:47160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jbsOP-005P8o-IK; Thu, 21 May 2020 21:06:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30532) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbsOF-005P8h-8H
 for samba-technical@lists.samba.org; Thu, 21 May 2020 21:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=4PGJLbq3Wq4EWQQLvIpUsHuLshmRr6hCLAiVNGgNUwo=; b=zZeXxaRzgL9XprGLFqJZqFCzid
 j4i0nkwPG/KGAPK8a3wRx9yVqcvl9uvQawnVjFeLK5Q1ZvFeiIRfyGt8ZcRGcGqa3W0DwSiWO8N8M
 3pJqL1nHvw9B3yHHpBIslbTj7NQq/EbXTA5ddflvgvQe5ObmnH+oWprjGOUuPiSNpWe+uu/92kvME
 WeE9sCp5rALTDyADLESn6XfI75pY1CQtBoR4D8+ML8A4VbJlCrazZoOvfNAu3E3mbNRvEHX6Y89OH
 r8Li0HrGc3XjU6X5trgDDj08C4+/KL210ysoSY1q0tuyIXxCXvwBlVRyu5N/IzzsDpPvWNXQFwYL+
 5CySGIsnvfgo1bam0A0EuRYh542UxTtfVaDY8TrIyAlBd4p6UQckg9rjN690xxyEMj1qBUFrFkwxH
 e7thUJdlSdv7KQDXry1qSqw338oPHxM5/HoJ4sNk5l5ExF/VhcGv46+hsURrz8UIIZQz8ix8B3ne5
 eEY7LSeopiOfPLpt++qlsZE7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jbsOD-0000iC-Nq; Thu, 21 May 2020 21:06:06 +0000
Date: Thu, 21 May 2020 14:05:59 -0700
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC: Community bonding questions
Message-ID: <20200521210559.GD18572@jeremy-acer>
References: <CAH72RCWL=4v4Ek9c-YbH0JYLX64iYK2NA83NOTYOHMN0uZ7A4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH72RCWL=4v4Ek9c-YbH0JYLX64iYK2NA83NOTYOHMN0uZ7A4A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Alexander Bokovoy <ab@samba.org>, samba-technical@lists.samba.org,
 abartlet@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 21, 2020 at 11:03:52PM +0300, hezekiah maina via samba-technical wrote:
> G'day everyone,
> 
> Please correct me if I am wrong. So when you provision an AD DC using the
> samba-tool command line utility the following files are created or modified:
>   smb.conf
>   *.ldb / *.tdb
>   krb5.conf
>   resolv.conf
>   /etc/hosts
> 
> Are there any other files that Samba creates or changes?
> 
> I have also noticed a lot of discussion on the mailing list around
> Kerberos. My understanding is Samba uses Kerberos as it's authentication
> protocol. Are there other authentication protocols that Samba uses apart
> from Kerberos?

NTLM (a catch-all term for all the NTLM+ varients) is the only other common one.
Documented in MS-NLMP.pdf.

