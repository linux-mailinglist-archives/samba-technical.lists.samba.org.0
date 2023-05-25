Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF02E7110D4
	for <lists+samba-technical@lfdr.de>; Thu, 25 May 2023 18:22:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=22eG7BXNAIL1MbMoQoScnc2JH4lgRLdbGNetQnX6RDA=; b=aFF5lN8L8YII82ncGT0Ty/xx0P
	yh8bb7IqqOWlvENlup429rou5mkMU/J210TP2WYiEgTFl5BZ23F9IY35bgof9fXUy8wzzob7RiFrW
	FK9/xhZ+ce2Z00gU+XN98W11v3/TXNT05Cwa3LdWhnWNaiqGtiGWYFhmm0G5NoaEFSXzhcVwVYg4Y
	ZoE4FYNYXK9yXTjWAofBr9tiZ6XjQuKXb0bfACpAFCINSUxw1mwqFWBBrAmp6aIQMhDeJk9vpx5d5
	hqsS4YeLFB0u2GGUl/+YWL5TfOjPw658Hqn2W8uufVMnqFe6DjrQ5BUdZJNKXF15VkL6YIZSVtwod
	uFuuJNYw==;
Received: from ip6-localhost ([::1]:19608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2DjO-00CDAu-VM; Thu, 25 May 2023 16:22:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48196) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q2DjK-00CDAl-07
 for samba-technical@lists.samba.org; Thu, 25 May 2023 16:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=22eG7BXNAIL1MbMoQoScnc2JH4lgRLdbGNetQnX6RDA=; b=fTCoX/uGBwZAo2yp7cMar/57V8
 tA5mx0ArTom7loJJAd5+CTRp46msbucyka6i5gBWhrd6NXD4qTJWUrDOi/UIgM8UisH7esDj1YbBQ
 lFf3pZ5iBR4K5ipcK9RYE5hjhEN/swFXevRc4O2oHFRnwaGjeN+PDAOhf1qSa2jkGEWySz9vOLWcj
 hYTw2Knr6/UB0EkDRCPZRNZrIl9ad7zB62ntuZ23sGgOAT9/px9MNtdo85dUD3BQ6GoiAvOwvL8sq
 pJ/SqZ5ojZJYjecxUlNWgXbrtyDAnlbGcQUYITNr1BF0SOpshYiFvomiIz4we9kA37ktB7bFRlfro
 ZhKxf27RWhkin2Au8U/ApB05ZKXa/11Wto7ycEuC+y+Pe6/2f//Z2k5eMjIQ1FdHbtiyDor5ri5uJ
 D3ZWj7Ujjs9qK0rWYuZCRL6BeUvdbw/0fEQFcPk0Ae3PYOJa9nBNc2vEjpFkcM7Tb8FHRhf0WglUy
 jRsAo9gwI/HunDykicQcsVkN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q2DjI-00CA8u-2l; Thu, 25 May 2023 16:22:20 +0000
Date: Thu, 25 May 2023 09:22:16 -0700
To: ronnie sahlberg <ronniesahlberg@gmail.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: Displaying streams as xattrs
Message-ID: <ZG+LOKTr8B+zjQsC@jeremy-rocky-laptop>
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <20230525093900.GA261009@sernet.de>
 <CAN05THTi0BC_iwjXMiWn61fg3hRemi5Momwp3O0WGygyWLGomQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAN05THTi0BC_iwjXMiWn61fg3hRemi5Momwp3O0WGygyWLGomQ@mail.gmail.com>
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
Cc: Steve French <smfrench@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@sernet.de>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 25, 2023 at 08:49:47PM +1000, ronnie sahlberg wrote:
>>
>> just took a look at how the ntfs-3g module is handling this. It was an option
>> streams_interface=value, which allows "windows", which means that the
>> alternative data streams are accessable as-is like in Windows, with ":" being
>> the separator. This might be a nice option for cifsfs also. That option would
>> just be usable if no posix extensions are enabled of course.
>
>We could. But that is a windowism where ':' is a reserved character
>but which is not a reserved character in unixens.
>For example:
>You have the file "foo" with stream "bar" and you have another normal
>file "foo:bar"
>Which one does open("foo:bar") give you?
>
>The openat/... semantics that solaris uses provides an elegant and
>unambiguous semantics for it.
>You want to open stream bar on file foo?
>1, fh = open("foo")
>2, sh = openatf(h, "bar")
>
>There are at least two non-windows related filesystems that support
>something similar to ADS,
>solaris filesystem and apples filesystem(s) so it would be nice to
>have a neutral API where an application can use the same
>code to access streams be they cifs/ntfs/solarisfs/applefs/...other...
>
>Steve, I think this would be a good discussion topic for vfs meetings.
>Is it desirable to bless an api in the vfs to do alternate data
>streams?
>There are at least 4 filesystems that provide this feature, 3 of which
>are still very popular and common today.
>
>One approach would be to mimic the interface that solaris provides
>with openatfile-fd, "stream-name")

Solaris is dead, dead, dead. We should not resurrect the
warts of that thing in Linux.

>But that would not just be a filesystem change but also a VFS change
>since it would suddenly accept passing a file-fd as argument
>as a valid option (for those filesystems that have signalled
>alternative stream support?)
>while the vfs currently only allows openat() on a directory-fd.

I never thought I'd be calling on Christolph Hellwig
to squash such a horror before it emerges, but I'm
  CC:ing him on this email in the hope that he will :-).

>ADS as a concept is really powerful and could be enormously useful as
>way to attach metadata to a file object in a standardized way.
>There are very many use-cases where having a file that embedded both
>the executable as well as various other types of data but still be
>able to treat it as a single self-contained file from an end-user
>perspective.

Please give real examples of something for which this
is *essential*. Not "could be.. useful".

Hard mode. Windows has yet to find such an example :-).

One more datapoint: "still be able to treat it as a single self-contained
file from an end-user perspective." - please enumerate
every single tool and archiving program that will need
to be changed to treat a file containing alternate data
streams as "a single self-contained file".

>This should be discussed and we should probe the vfs folks about what
>they think about it.

I hope they just say no :-).

