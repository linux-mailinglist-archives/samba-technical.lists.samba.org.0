Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AAD10B716
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2019 20:58:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=y96KkGHjl3s/Wybk1hiqKSbPGQPS3P/QOc9/gleGC1A=; b=jvILU443EpgRvfGyqoYsZLXLaj
	+PQwcaTz9TLUWThx8MejPQwexfHFVuMM5xMf9AnlR/4Sjj23/yX4b5um34aXImMDsJE46hylsjXvp
	2DXgk/xnnp3IFiLtLBdPZuGnABystMe2fcSc1Q9phool9j0Q3vZqnUfDyWPcwanR53EV2N40s31KH
	HfJe9Abn2mYNiIlDxG4N6tKLgs+3pNO4fuAs//Ovk9NEBMyDsJe5eOuNBV1KnSx5ksY3p9DnDmE6g
	KHN+9Eu+Ew3jL4jEP6Vw+MK5DIUDvrqpqeYU460Za1RFsx2rRY/yBz5G5wr182fOYmXB1NFNX+gEg
	CrhvFUug==;
Received: from localhost ([::1]:27248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ia3Rd-002rfk-4q; Wed, 27 Nov 2019 19:57:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:39179) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ia3RW-002rfd-B8
 for samba-technical@lists.samba.org; Wed, 27 Nov 2019 19:57:44 +0000
Received: by mail-lf1-x12b.google.com with SMTP id f18so18130869lfj.6
 for <samba-technical@lists.samba.org>; Wed, 27 Nov 2019 11:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B+iCzn6zy0zWOUkzUZMEBgZSIs3qDjkBXtbAb8GHHOE=;
 b=cYYyGXZfy1iRG92GMZOjYnzuJGaT3htvIn/zoGEaOAfhggN9FbI0sEGQUsV/0LD7UJ
 ewqe2EcD3Q7Qio1Os5TJt3QJl88xiGLxaK4hgeJ2+qsOb/zz9MbnirSB8SZ1+Ylk6g3G
 xA4mb5oQmvj7tXiVMIe5A5QHbElFH9T67zr9+RRrTdrOgmhBoBZtm6nZ4yhGLXimi0mi
 lHgG2u/Dhu26Y53cfsnngTxYBgwW0sUmyzMp1R3ENezAYsTp3MqBAUe+TGoZqVdAXFIx
 tTHJksYMhbeAdOs1rrXOkc8zD0t5JsuE8IKxDrjnfwyvpVhOeDFqLH/8XFpWyAfgcoTh
 /xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B+iCzn6zy0zWOUkzUZMEBgZSIs3qDjkBXtbAb8GHHOE=;
 b=G+kdtYAOcHVcak3nDLe/Oarfv89fyTD0WCJLiZtsgVifD6who4HFrPivWaJY/XqAyE
 nfCGi+dA0M9ZgqgS1bPGXLdDDmr+ZZaJGgyw+l57jzM67INYefcWthXIBwyOuLBAKMOK
 LTgdeMZvqhi/TIFGk/SemojT5M+hUwdVCWiBNr9LJrfU6JnzMoAMscNe8davheVbHDvl
 BiKszmSTtw2BEu2SPYpmSWW4E0QOQxq607Suh2FB+DgMyQCNjqwbnOJhdFUJxsEPpHgg
 pdyI1zKvs7UYuyn2yhQwDITGoCBuNeYMZ3eEdGZTyTe/4u4VVJj+xSFmGOEbFO0Jegny
 4QCw==
X-Gm-Message-State: APjAAAXq12ANCJJqOQvoccTTOt6KEciqSbGLA7H+PUd2S3lXY44afE8f
 m+0FH2DeoDW5Jb4K8rrlXgPUhhK1IxNRjZEo5aclvRlB7OM=
X-Google-Smtp-Source: APXvYqxmNyDq/FtxOAgLPbMVJgICYiCwwtZsoFiYwPdoFVwWBWOkXIkVJbfjVZBOsZhXerJxgrqeBzIz45cycUrj31k=
X-Received: by 2002:a19:c7c5:: with SMTP id x188mr4084312lff.22.1574884658980; 
 Wed, 27 Nov 2019 11:57:38 -0800 (PST)
MIME-Version: 1.0
References: <CAPw4iV5nHkd8E=9PfbYepaStPRoqWJX+iZRVicgrRf2vcHK3uQ@mail.gmail.com>
 <CAPw4iV6qTv5ssFZEFUN0zuVuZ38ofXq_x+QSTUHT8QFrBtmRhw@mail.gmail.com>
 <fcf29df7-34c6-d30b-f2ee-d46a8c9a3d41@samba.org>
In-Reply-To: <fcf29df7-34c6-d30b-f2ee-d46a8c9a3d41@samba.org>
Date: Wed, 27 Nov 2019 14:57:27 -0500
Message-ID: <CAPw4iV6ZsSh2O3=g18HTO+1kPPNor4on-ijHmUBLyX4cNOPsUw@mail.gmail.com>
Subject: Re: Why is smbd looking for Kerberos principal cifs/host@DOMB when it
 is a member of DOMA?
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: "Nathaniel W. Turner via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi metze,

On Wed, Nov 27, 2019 at 4:33 AM Stefan Metzmacher <metze@samba.org> wrote:

> Did you take a wireshark capture to see the kerberos related packets?
> Does the client really provides a ticket for
> cifs/kvm7246-vm022.maas.local@TC83.LOCAL?
> Maybe the cifs/kvm7246-vm022.maas.local principal exists in both domains?
>

Ah, yes, this was the case. After confirming that the client is sending a
ticket for that principal name (via wireshark), I found and removed the
(stale) computer account from the tc84 domain (it was left over from a
prior test). Now I can authenticate as expected.

Should samba fall back to ntmlssp in this situation (stale computer account
in the client domain)?

As far as I know the principal name is ignored when accepting kerberos
> authentication, but maybe you hit
> https://bugzilla.samba.org/show_bug.cgi?id=14125
> or the ticket is just not for the server you try to connect.
>

I only partially grok the issue there. How can we determine if that's the
case? I suspect I can recreate the problem scenario easily by joining my
samba machine to tc84, then leaving the domain without removing the
computer account, and then re-joining tc83.



> Which kerberos library is used in you setup?
>

For this test, I'm building samba master from git, with default
configuration, so I think that means I'm using samba's built-in copy of
Heimdal. Is that right?
