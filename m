Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE3F5EAE0D
	for <lists+samba-technical@lfdr.de>; Mon, 26 Sep 2022 19:22:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=oz49UtbRly+u68s0aZIxtbOYRVV9DtJyLvY+Kj1FwnE=; b=HuWXpMp0GxOGzicOs8QITkqxdJ
	FsJ/tzM2bQqz4rLAlHDke7VxvUVXiL35eIkFHk4DzvNLqYCg61Rlxsn42F1JpTjTp6If8MvMHbg97
	YvxmC68qk6VfuYUbbW3KMxt8GP0aF4vEUMloUAytS6UiqV36RKXNF1Qs0vmyQ4ZZeJ3zYRUD5a2EP
	JudWNszzS/xwiCXY91VDzFUfeWslQ7ayEmfOstPtCEJJN85P6sET55MtBNQqcEDYGT+ck2NFNPRh0
	MKdIAZi/+Wkcd+SdVlKS5GAOKf/skbl00mONhaKw8A9vx/GHQ64o22TwsUIfBNTlw7jtHqwvcVy+x
	2RPOiIuA==;
Received: from ip6-localhost ([::1]:27752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ocrnc-004HUR-C8; Mon, 26 Sep 2022 17:21:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44096) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ocrnV-004HUH-Lw
 for samba-technical@lists.samba.org; Mon, 26 Sep 2022 17:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=oz49UtbRly+u68s0aZIxtbOYRVV9DtJyLvY+Kj1FwnE=; b=iPuImjG7uSUPqtJWKQITet/3Uv
 90r/+H49/9OYzgjlaQbLFyEm2iqpzDJH+AYRWdiqeRpsewTSt1qj3UHZfdRdD6aumrMnkai2QfCKL
 pM7l85R4zS7Aw9MVR6qxHkfCmBRWMpMRT0BJ2JTsuoJpYQouPAPpUneFWKJGCVv4DtTWHLy54iCVN
 +M3JxinWcgeyP239TE7h6lFbbbHSCAjTlhJoncwxaEZePj3ycUth+pABlJpECpUdTolHZSJoySxGN
 mwv8JrQPOkVSi1iE7UMyUsRJ0g8xot2IUDRiCC8R4hfKTdF38c8AZ61WUUmOKRFwhyEmugZhtb4n8
 fi97gqvJ8I7zueHJVd6PvYpnNLU+TYZI7TMc7FhnRU/jeM7ggvuDgbsTLycItE3uV6abBnSOgLqYR
 kalLOmBhTLVmUx2XrB2FnvbzG94L/+y0eyr/ilOC6qYGiVHHByQvi4HqTa8Yaffn8x7Z4c1K7y4C9
 us5CuU15wtOx2XzqgevA4Yl6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ocrnU-001zgE-3s; Mon, 26 Sep 2022 17:21:36 +0000
Date: Mon, 26 Sep 2022 10:21:31 -0700
To: David Mulder <dmulder@samba.org>
Subject: Re: SMB3 Posix Setinfo class?
Message-ID: <YzHfmxSCB34UwCz+@jeremy-acer>
References: <eb0a59e3-6f29-4059-8278-2eca8a57c5da@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <eb0a59e3-6f29-4059-8278-2eca8a57c5da@samba.org>
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
Cc: Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 26, 2022 at 11:12:28AM -0600, David Mulder wrote:
>Currently I've defined in the smb3 posix spec a set info request to 
>use the FilePosixInformation class defined here:
>
>https://codeberg.org/dmulder/smb3_posix_spec#2-2-34-1-fileposixinformation
>
>I noticed that MS-FSCC (section 2.4) defines different info classes 
>for set and query.
>
>It seems to me that FilePosixInformation, as it's currently defined, 
>is better defined as a query only class. Most of the attributes are 
>not modifiable via a setinfo. I think we should define an additional 
>info class for setinfo, allowing you to set POSIXPerms (any other 
>attributes make sense here?).
>
>Either way, I don't think anyone has implemented setinfo for 
>FilePosixInformation anyway (it's not in Samba at least).
>
>Thoughts?

What specific attributes do you want to set with
FilePosixInformation ?

The file mode (rwxrwxrwx) is set by a normal
SetNTACL request with a specially formatted
ACL.

I can't think of anything else POSIX-specific that
can't be set with a standard SMB3 setinfo
the same way it's set on a Windows handle.

I don't think we need SetFilePosixInformation
at all.

