Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8302A00D7
	for <lists+samba-technical@lfdr.de>; Fri, 30 Oct 2020 10:09:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=eWeKx6arRj426oP99Vk6KF79y5vIUl80bsf0vV+dnaU=; b=AdSKh72IID027QE6uz10nwnkZ2
	2C2BxTxayKjudYbzmnCsVvpXSU+ZryZW1BLgmbFhpdUbkUbysFSjPV/RLPibGWtggPCriG/Vbrru+
	vO0basFzxJKqUJ0jPKFXGKhz/EaRW2NyxVp1UGlkkVhRWxGl6CdvqDucIyxjtxu/zkTUN+z0C2WW9
	UOeSiERToTHisIFktKsFFRnBDhPFLZyXd4x8ZAafC7MXNZpFQnUyAT7vzQI5Ouxwf3Pj8G3j/1yoK
	sCKHzGVHLaeEVr0Aidhy7fwlsWFg3MXdRDm9w1TyE8dRIgXccAPeKadTQew/cCALN3CKSbvABUM2E
	w0WrnAjg==;
Received: from ip6-localhost ([::1]:64974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYQPw-00EdBb-Dm; Fri, 30 Oct 2020 09:09:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60262) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYQPr-00EdBU-4U
 for samba-technical@lists.samba.org; Fri, 30 Oct 2020 09:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=eWeKx6arRj426oP99Vk6KF79y5vIUl80bsf0vV+dnaU=; b=kESiR3MN0uD0hwYIen3aZKmJbo
 WNNISp+5c4wE/SLGv0t+0eoLLe3wLWVIIaFuoe0QDB54sCV0B++h7b+D7/7757JNeCn9SIuKkpgQF
 s/UJmQsjzCKIKGD11rYPxR3zn06FsS6VUG3AjDB1VCLVTSdiXEBFKxbiI82mT0OabaVN1KnQ9Set8
 +lDqtSH+ZCBXxjja72/NDjjF47ba7Uf7aLLY+yMJKm7EgH5MpfkS6+5SyrWwtraPZflVgqmC3KpPJ
 hqZFsrZql1j5RwGLoXZAILRdFVvDhLP82dHjncEFYY7Hy5zNLOJK0jtwXB6vVJ7JWDyPsHHuRMLJ3
 OeZuwz5DT6acQFQI2F8Ti/3dJ+FjTNqrpIULfpl8v8F9UQuE9GYNvwF9G7VrUM3ubWIcy3mUnztKr
 UqbhMALolxLQmaN1W4FL5E9PcOnmbw2VzPVO3waAgU5Xx175m2TuLsSVvYiNvTGrmczYEtCLWKNX0
 vvw06xo7MiwSO3aldmG6yvn5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYQPq-0000Ch-JV; Fri, 30 Oct 2020 09:09:46 +0000
Date: Fri, 30 Oct 2020 11:09:44 +0200
To: Rowland penny <rpenny@samba.org>
Subject: Re: can't start smbd after install samba posix branch
Message-ID: <20201030090944.GC3718494@pinega.vda.li>
References: <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
 <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
 <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
 <758246149.55514473.1604038831866.JavaMail.zimbra@redhat.com>
 <47e9f3cf-e258-f441-76d5-4e72b4073031@samba.org>
 <2038917775.55518004.1604044565533.JavaMail.zimbra@redhat.com>
 <db176606-3dbd-b0d8-e249-9ab6cd693ba3@samba.org>
 <CAN05THR21TwQdcLUTDoa6bt13Zx5k+huT7Gg8m3TeGjBwPLqdw@mail.gmail.com>
 <fbc9e6a2-5934-c21b-cbc3-3d0dda0c4e32@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbc9e6a2-5934-c21b-cbc3-3d0dda0c4e32@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On pe, 30 loka 2020, Rowland penny via samba-technical wrote:
> On 30/10/2020 08:45, ronnie sahlberg wrote:
> > 
> > 
> > On Fri, Oct 30, 2020 at 6:29 PM Rowland penny via samba-technical
> > <samba-technical@lists.samba.org
> > <mailto:samba-technical@lists.samba.org>> wrote:
> > 
> >     On 30/10/2020 07:56, Xiaoli Feng via samba-technical wrote:
> >     > Hi,
> >     >
> >     > ----- Original Message -----
> >     >> From: "Ralph Boehme via samba-technical"
> >     <samba-technical@lists.samba.org
> >     <mailto:samba-technical@lists.samba.org>>
> >     >> To: "Xiaoli Feng" <xifeng@redhat.com
> >     <mailto:xifeng@redhat.com>>, "ronnie sahlberg"
> >     <ronniesahlberg@gmail.com <mailto:ronniesahlberg@gmail.com>>
> >     >> Cc: samba-technical@lists.samba.org
> >     <mailto:samba-technical@lists.samba.org>, belle@samba.org
> >     <mailto:belle@samba.org>
> >     >> Sent: Friday, October 30, 2020 2:30:16 PM
> >     >> Subject: Re: can't start smbd after install samba posix branch
> >     >>
> >     >> Am 10/30/20 um 7:20 AM schrieb Xiaoli Feng via samba-technical:
> >     >>> There isn't error log output. Just know the exit code is 1.
> >     >>>
> >     >>> # smbd -D -d 10
> >     >> try
> >     >>
> >     >> # smbd -iF -d 10
> >     > Thanks. Now from log, I know the config file patch is changed to
> >     /usr/etc/samba/smb.conf.
> >     > Create it. Then smbd can start. But mount option posix is still
> >     unsupported.
> >     >
> >     > # mount //localhost/cifs ~/cifs -o
> >     user=root,password=redhat,posix,vers=3.1.1
> >     > mount error(95): Operation not supported
> >     >
> >     > [81490.590281] CIFS VFS: Server does not support mounting with
> >     posix SMB3.11 extensions.
> >     >
> >     > smb.conf:
> >     > [global]
> >     > server max protocol = SMB3_11
> >     > unix extensions = yes
> >     > [cifs]
> >     > path=/mnt/cifs
> >     > writeable=yes
> > 
> >     There is a reason why it doesn't work, you appear to be using one of
> >     Jeremy's git branches where he is working on SMBv3 Unix
> >     extensions. The
> >     operative word is 'working', they do not work yet, so I wouldn't
> >     use the
> >     branch unless I wanted to test where he had got to 😁
> > 
> >     I suggest you wait until the required patches are finished and
> >     have been
> >     accepted into Samba master.
> > 
> >     Rowland
> > 
> > 
> > Not true.
> > 
> > Me as well as Steve and the other cifs.ko kernel developers have used
> > this branch for quite a while.
> > We even have a cifs.ko buildbot we use to test this very branch.
> > 
> > ronnie s
> > 
> Sorry, but I treat anything outside of master as experimental and only to be
> used for testing, you might use it, but would you use it in production ?

I think Xiaoli does exactly that -- trying to test the code. So the
questions asked are very much applied here.


-- 
/ Alexander Bokovoy

