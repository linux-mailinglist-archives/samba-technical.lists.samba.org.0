Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFF442411
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 13:34:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=pL6QCsE0VXRQjvEYNDkPuWKa/9Z/QIzgGKQWbVxzDpo=; b=siZm2fFu37E2ZpoFQAlI4UZdCA
	YwDTp5TjOG4CFj0C3iOyP+uz7X52skRh7APCgGej89V5Mz4a7Q5lY+E9RDoCz67Wl8GVytVmkQBZG
	CDXCWNh/8SKsVICQC/tqrlKPfqJjnJGSoj3d0uAHZkCtB4ZxlMonZ6BHgI6VGj86h2w6xIE5BNlBN
	E1Tz+iDhFISOAtydTIIn3I4UTf70vrjjN14bwXVqMQt88DoLgANFFO9hGOjy1ZhPcgQZWaYHhoiU4
	xuDyTfYlN+dMhXaBLIADiuzM5pShi5ngttLXh/AxhDSRcnq5L/P3TtVe6QFTcGpJrlq7CZggWely5
	bnHdkGvA==;
Received: from localhost ([::1]:56888 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hb1Wb-0018zZ-D3; Wed, 12 Jun 2019 11:34:41 +0000
Received: from mail-it1-x163.google.com ([2607:f8b0:4864:20::163]:53137) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hb1WX-0018zS-6I
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 11:34:39 +0000
Received: by mail-it1-x163.google.com with SMTP id l21so10166748ita.2
 for <samba-technical@lists.samba.org>; Wed, 12 Jun 2019 04:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mandsconsulting.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=tDpPB06u6lh0h4F186GKUqPo4mm0WEPkDz0yDMz5Ojs=;
 b=cx3sdJXgwIdB69ElH6380Frx1xF3+JojWOjkKLU0LPmWoIplQVkSfepiY7985Bn3il
 0sfQBQmkO4A6htCDwwKIXihz1f4HhOVlH+50MT0ivDwLfuc64HaqTVhRhu73ci0nXObU
 7Z4ggHnjDbGNtB5vSKQyGM/ymI++ocn8XJAL0fwylmunuBc6s2tDam2UTVDlTUZkvn97
 VTbzI7MCHMHWTLSDAZUYJn2Aj56k6rrJQAtcdTea2NxudtTDZqa3MWE/CJejC77+n1oB
 Ya8etPyVLPJBvw+KE4X+ZFVpR7DrnDaqZEbWpv6Dn+Gh7pYjhoQhMbBCVC8/i7/+DZSJ
 jxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=tDpPB06u6lh0h4F186GKUqPo4mm0WEPkDz0yDMz5Ojs=;
 b=JeyvRHwROY3PJYlTV9Ons3hNfmyjOtx/pnRe+5RlUAea2/xXZc3Lz2erp4fB8ALcuE
 1eYX3WS/wQ1ob5I7bMA3oqcTQiafoWaNyk7+5vGMBkHS+PVAX9DXCXYRYC3hbHetgzps
 4q+064ZxPZvWGTZ5Q8Cx3/ZLLoWeRgBEigi5iqRutcZB47rpj7VcO0EN0JXvDsAEmDrp
 Mq3Z2ozbwXzHV7PTSF+nYQYcPihli4Yjfg2X9nsrG0tB9B8QLk9YJLNp3In5NoTgygR1
 Yd9SBBakCctCVVjrXxTRMnpzoKELuUQvzKcS6Y37RAuuaNUFZ6bYdKlip6MrPhrbv5s6
 c4CA==
X-Gm-Message-State: APjAAAXvV5WnzDOkQVWyKEcNCI5Bctjpcgt+6IpVRHhRe6rUfnQWrkVY
 vYrR5Hladjp3tqi7NpD37jvyLjSY6z87I3iCiAlWgzYJFjW8
X-Google-Smtp-Source: APXvYqwl0dMzFGjOih9KaTngmxGgg0BXrYfCW7GNpyTR470CoPcbJ5uy2ntXoelXsXia4dzGiDC1pX6Efgfa
X-Received: by 2002:a24:3942:: with SMTP id l63mr11777322ita.122.1560339271123; 
 Wed, 12 Jun 2019 04:34:31 -0700 (PDT)
Received: from elk2-relay.sendergen.com (elk2-relay.sendergen.com.
 [108.163.197.50])
 by smtp-relay.gmail.com with ESMTPS id g65sm56131itg.9.2019.06.12.04.34.30
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 04:34:31 -0700 (PDT)
X-Relaying-Domain: mandsconsulting.com
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198])
 by elk2-relay.sendergen.com (Postfix) with ESMTPS id 8A8638031FA0E
 for <samba-technical@lists.samba.org>; Wed, 12 Jun 2019 07:34:30 -0400 (EDT)
Received: by mail-lj1-f198.google.com with SMTP id v23so2647258ljj.1
 for <samba-technical@lists.samba.org>; Wed, 12 Jun 2019 04:34:30 -0700 (PDT)
X-Received: by 2002:a2e:3013:: with SMTP id w19mr31365667ljw.73.1560339269189; 
 Wed, 12 Jun 2019 04:34:29 -0700 (PDT)
X-Received: by 2002:a2e:3013:: with SMTP id w19mr31365651ljw.73.1560339268876; 
 Wed, 12 Jun 2019 04:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAPKK0PPaLLXnh5Gu-EHeUGcKkATp4rva4LzcnhCU3SsACMyb4w@mail.gmail.com>
In-Reply-To: <CAPKK0PPaLLXnh5Gu-EHeUGcKkATp4rva4LzcnhCU3SsACMyb4w@mail.gmail.com>
X-SG-Signature: true
Date: Wed, 12 Jun 2019 07:34:16 -0400
Message-ID: <CAPKK0PPxz7RSLqE4NOmXah6_qvpbwM37XwxYOX035QQ9mi3XGg@mail.gmail.com>
Subject: Re: ChangeLog
To: samba-technical@lists.samba.org
X-Scanned-By: 'EmailPostmaster' on 108.163.197.50
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: Steve Cook via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve Cook <steve.cook@mandsconsulting.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Can anyone point me in the right direction?

On Tue, Jun 11, 2019, 2:10 PM Steve Cook <steve.cook@mandsconsulting.com>
wrote:

> Hi All,
>
> Is there a implementation of a changelog within Samba4?  I need to be able
> to encrypt and store password changes for a user.  I then will have an
> external tool that will connect to the cn=3Dchangelog using the decryption
> password so that I can get the clear text password to change the password
> for the same user in another directory.
>
> Thank You,
>
> --
>
> Steve Cook
>
>
> [
>
=E2=80=8A=
