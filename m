Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F25784D60
	for <lists+samba-technical@lfdr.de>; Wed, 23 Aug 2023 01:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+tCPkHp+YBUmbMrqpbllANfy8ELVykQMBIWn/DNGp9k=; b=XBMdVl3Y4bEydqybBhKdpDPnK7
	aAuz7yWGbMLrevPoPNFug9OTziNtPEp4YHly/FY7EFZ64OkXDk0+PsMOJP8sMFBxJWfEEGJ9mDgN7
	A7K+VAR19qZ0c5ftra/eqc3cwrU6oxUAl3bPyUtaTUULwlj5eSVil+SAxGD+feq4RTAwqJ/n+tbeI
	Kw1DJytFlPxC6cpUtFZ9zF5GFzd/X9lKOHXzzF20Jlf2h2NSxJGzdt9ybS9mNkxmdMYU26zw0XClG
	GD55pfWSx42rMIn6SJcimLuFcoskZTK8HEj61JWKZX+5FH1+H3B5AzxsE162kmX3BQ33F2HVNLNhO
	BZaECcOw==;
Received: from ip6-localhost ([::1]:57356 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qYasG-00E6em-Hu; Tue, 22 Aug 2023 23:33:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22628) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qYas9-00E6ed-RK
 for samba-technical@lists.samba.org; Tue, 22 Aug 2023 23:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=+tCPkHp+YBUmbMrqpbllANfy8ELVykQMBIWn/DNGp9k=; b=InM8KhCVLdqSG3EVOYBvxRU1FH
 kZuRpYjyMl95tJi0k0BxRlcFJXJ8fMzR4BNbDU/9aAxvUrETtGee4Qv6d3W30ljwUdwm0HinqE7dg
 3C+nX1G186YYjjG8Dfxk2O0lvflr0SKZqfSvWqbD+SUJLQq5yjknfjANsdRYCzWbqiTd7V3j6frDi
 LQgZfwEWu8EOz83SWG84PNYxIp7vDo0lJmKnqaJFif1xcopTsn5PbHj5PkR7346hpIqS+tGxiDY4U
 qCXbCepNQ05Mfo7GwPivUPMcTfRUfD3b+7P1TL+lmhtCN/AA7M1HvP5+1kDFKVRz6qxgwPRUits4w
 boeo6wEZ882oHKWOdGZha2+n6fGdTgu9HajTrssN1epDk5OqCfhVzHTF2ZAw4eB63tvfTV8hBvdHg
 yYGbVWAy7t4Zqt3jVAkUlOKWBpkiXqGH+EtcJs3vm9LPhV7cHf2XV9SBldKGVoAJpA3QPm34hXpXN
 NYNmmAFpA7AjMZlVrCpez2+q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qYas7-009UCm-1D; Tue, 22 Aug 2023 23:33:15 +0000
Date: Tue, 22 Aug 2023 16:33:12 -0700
To: Steven French <sfrench@samba.org>
Subject: Re: where to get the patches for samba over quic support
Message-ID: <ZOVFuPKFu67gbhwd@jeremy-acer>
References: <CADvbK_eHYFJWL3xaZeciUMPjWXqkP_Kp3DrpP-3XPyopY1yZmg@mail.gmail.com>
 <1c535816-0a9c-6924-642f-508e82cd0237@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c535816-0a9c-6924-642f-508e82cd0237@samba.org>
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
Cc: samba-technical@lists.samba.org, Xin Long <lucien.xin@gmail.com>,
 wedsonaf@gmail.com, jra@samba.org, CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 22, 2023 at 05:02:26PM -0500, Steven French wrote:
>I was very interested in this as well and there seems to be a logical 
>use case for SMB3.1.1 mounts from the kernel client (cifs.ko) since 
>multiple servers already support QUIC for SMB3.1.1 mounts (e.g. 
>Windows and apparently also an embedded server that demoed at Storage 
>Developer Conference last year).  Key question remains how much of the 
>code can stay in userspace (so only the key socket read/write code 
>must be in kernel, not necessarily the connection setup).   There are 
>also some interesting points that the Microsoft QUIC (open source 
>project in github) project guys mentioned including that for testing 
>you can often do "unencrypted QUIC" as a first step (which also has 
>performance benefits over TCP)
>
>We can discuss more details if you want, but Wedson had some great 
>ideas about doing some of this in Rust (and looks there are already 3 
>work in progress user space opensource QUIC implementations in Rust - 
>so some of the code could be reused)
>
>
>On 8/21/23 09:55, Xin Long wrote:
>>Hi, Samba Team,
>>
>>I'm currently working on QUIC implementation in Linux Kernel, and thinking
>>of applying it to fs/smb for SMB over QUIC in kernel. For interoperability
>>testing, I'm looking for an existing userspace implementation for SMB over
>>QUIC in Linux.
>>
>>I heard there are already some internal patches in samba for SMB over QUIC
>>support, anyone knows where I can get it for this testing?

I just did some research, and this engine (in C) appears to be easiest
to use for Samba.

https://github.com/litespeedtech/lsquic/blob/master/docs/tutorial.rst

The tutorial shows an example being used with libevent, we could
adapt this to libtevent.

