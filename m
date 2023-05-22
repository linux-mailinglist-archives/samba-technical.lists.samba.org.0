Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E8C70C32E
	for <lists+samba-technical@lfdr.de>; Mon, 22 May 2023 18:22:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=YsOTrpqC/nUNjWwm/2EcGoDbGfwHE0gi+Kt786GAkPg=; b=BuM8i12Ow9noJXkk0zNDAZ/bS0
	2jgtBorzRslk9eoQelJHEUfieTqDcfWxVjl8u8S12DyE2rrkSBJ7q9/YTew4u9h1WboTFaaDiMdIS
	p3pi0OhjShUlDJ8yjcpcuuQrmQVYEVvGx9D0GNa0d9OcMw0bt2OLHPUjiyHq0uwKY3SypO6tyR2/n
	HX6yHKSl1156M7K4YeRqT0WDGqZXmNhXgr7nwpLDTnK1Q3NFulL+qYlyK3ynS+1eiUStgKhs3ni4p
	BycAxdFd/IYG5BnnnN2D68hdZi9oz/2sGqTKpywUkdXV2jk7Kuu3U5C9jfYoBMgLJuGMkifHxwIxQ
	6M7B8f/g==;
Received: from ip6-localhost ([::1]:22488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q18I0-00BNwG-7N; Mon, 22 May 2023 16:21:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28950) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q18Hv-00BNw6-RY
 for samba-technical@lists.samba.org; Mon, 22 May 2023 16:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=YsOTrpqC/nUNjWwm/2EcGoDbGfwHE0gi+Kt786GAkPg=; b=LVmaiP+mguMwz44MSZ0on3QTJW
 uYuezWpjv4hLfc1NGh6D1MARLBde+zte+Bjr93AX6s0CF/BsAC4QXtn8yYE7E8jM+u4Ai/e+/QNuo
 oavRkoKbD4FSmBlM3FlqUX1rspoj46RNSkQJdIJYTuH4bcTOu2Xhqfn1WEtSICR1njo2UaTVX+UWp
 ku6JStMWxP2q1j5Wq3aOVRhB5olqKQGwPeHx2GnvS3GPJea8/nTtriGAiBTKo9j1GCygxyhBzq0XA
 FCeT8hL3a12CzVyavjuIc2DWbKiTJyfQAlDcaClZfNqYxy5laVSFmQzfw3YOWdQWejVST3QlR80Li
 SO3jIaoJDp6pZEPDBZgZZkfGJ+JmWHWEusDPVnKdMHAIXyUEF/i8Fwg/KuuZVgG72oYtVX4BWcF5C
 G0oefLVy06JuEv2pZ+K/+ZiMjqLuB5upwcWJnpxsK8HmqHRL3Pfip7tEaz5g24hry8rF/Npe1Z9oF
 qnxEIWLZJiBS9Zi3/dfyyjPF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q18Ht-00B8zB-HS; Mon, 22 May 2023 16:21:33 +0000
Date: Mon, 22 May 2023 09:21:27 -0700
To: Steve French <smfrench@gmail.com>
Subject: Re: Displaying streams as xattrs
Message-ID: <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 22, 2023 at 01:39:50AM -0500, Steve French wrote:
>On Sun, May 21, 2023 at 11:33 PM ronnie sahlberg
><ronniesahlberg@gmail.com> wrote:
>>
>> A problem  we have with xattrs today is that we use EAs and these are
>> case insensitive.
>> Even worse I think windows may also convert the names to uppercase :-(
>> And there is no way to change it in the registry :-(
>
>But for alternate data streams if we allowed them to be retrieved via xattrs,
>would case sensitivity matter?  Alternate data streams IIRC are already
>case preserving.   Presumably the more common case is for a Linux user
>to read (or backup) an existing alternate data stream (which are usually
>created by Windows so case sensitivity would not be relevant).

Warning Will Robinson ! Mixing ADS and xattrs on the client side is a receipe for
confusion and disaster IMHO.

They really are different things. No good will come of trying to mix
the two into one client namespace.

