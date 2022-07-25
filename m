Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F3357F992
	for <lists+samba-technical@lfdr.de>; Mon, 25 Jul 2022 08:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=6pyt3T5x30kr5AhC96VkB7FfkysDE8vWUZlK936Cbuo=; b=GK31qUc/D5tusdMswWJNiY3vD1
	U/mFdblPM2zpqI7+zKiszT7Cb8fjicFJoxP++mZ1qOsPrOBTz47idVww3V+wwVNxE3uG2x96ntl5z
	N2g6XGRgZX6kpTh07pfStvNZySRtNlKtvDfG8BpSrTRpioafxhJxiNINrghvtYaSxH0NjKpGJE8cH
	ozPgwNU9eDs7kPtOqUtPChvyU28HqFo/EYHW7ZiriKKpD7bdfi3pWzfAo7Cs8hhA0njbVVqqZMkKe
	2W7Dnd4rCVqgphu2q1DByTnozWXqdSgmM5sh0eo5zlRUbpF3yJ68W3qTptnlbxubfL5TSgoNJ70mD
	jXN5yEng==;
Received: from ip6-localhost ([::1]:37306 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oFroL-001t6F-0h; Mon, 25 Jul 2022 06:43:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25504) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oFro4-001t66-RD
 for samba-technical@lists.samba.org; Mon, 25 Jul 2022 06:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=6pyt3T5x30kr5AhC96VkB7FfkysDE8vWUZlK936Cbuo=; b=BfNDoEBqOrHCURjmDP54ZCQw/R
 yxAWQeAKw4GuNN/MqTPH7Rn4M0npm7BV4CWnbjmqFriK8Gb2huBJY40vuWJNbZ+Dk9bHWBzDPWdv3
 UwKzuHRzL//o8fzguQe+4UxvyBwJ7TLoXfNJ+lGoqI8gbqX+67FjHpSukWpMLhu+xqC6RDJCSGlf4
 U81fDoLnnicfm85Z//oD1tsmMebI1xWMeOLqBVraKdKEffWBAIsu+pViTV+QgzP1uyEceufVenkEj
 nc0/l9dLpBuogseaBICiDJLjlhBCTb9A8gT1xL6DcHeuFUMe9F5i+24+sHqEfr/hwSknEEfcqgdTE
 1J1NHt291ZEHjeSn0pOpqtEGDV47Jj0X2EHipu+e9bG1mpJtsb0PKoDFbuvLDbMvmg6FYEXx7kmUg
 kSbJ/70WXhX0iLt7XrWh89BazJ5DZV8rXwjlyLsB3+JJjYmrtuK61hfwP6evfeXPs8n4wBPiV48cc
 ZTh4zMkWg4ASXwVerpiNN/76;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oFro2-006L17-9W; Mon, 25 Jul 2022 06:43:06 +0000
Message-ID: <32ca91c03708ad035e01ab768af6054927e2b2dd.camel@samba.org>
Subject: Re: [Samba] Samba in Kubernetes (and Containers) - Release v0.2
To: Ralph Boehme <slow@samba.org>
Date: Mon, 25 Jul 2022 12:13:04 +0530
In-Reply-To: <c4611b9a-84c9-0a9c-2a6b-b8b30ea52ee1@samba.org>
References: <3245098.9o76ZdvQCi@pretzel>
 <6fd92c53-4f64-ecff-6568-9a01908d958b@samba.org>
 <26648066.1r3eYUQgxm@pretzel>
 <c4611b9a-84c9-0a9c-2a6b-b8b30ea52ee1@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
MIME-Version: 1.0
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@samba.org>
Cc: John Mulligan <phlogistonjohn@asynchrono.us>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2022-06-10 at 10:47 +0200, Ralph Boehme via samba-technical
wrote:
> On 6/9/22 23:26, John Mulligan wrote:
> > Indeed, thanks a ton for making this happen so quickly. I can't
> > wait to try it
> > out.=C2=A0 I'll need to make good use of our 'nightly' builds that
> > consume pre-
> > release samba versions.
>=20
> fwiw, there's also this MR from Jule for the smbstatus JSON output:
>=20
> https://gitlab.com/samba-team/samba/-/merge_requests/2449
>=20
> It would be awesome if you could give it a whirl or at least take a
> look=20
> at the example output and let us know if the output format is spot on
> or=20
> if there's anything that should be tweaked.

FYI: Our colleague finally got around to try and consume these changes
in smbmetrics[1] and was impressed with the details included as per the
latest patchset. Unless there are any objections let's get this into
master soon(may be even before 4.17 branch is cut :-)).

[1] https://github.com/samba-in-kubernetes/smbmetrics

Anoop C S.

