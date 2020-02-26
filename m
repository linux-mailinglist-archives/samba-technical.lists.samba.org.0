Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E12170BF9
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 23:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Rqak5LzVuAjk3JeKh5e+pRIZmB8x8YKQOpiIZcgpJbY=; b=2DjHM62wCpzd28BdjqKzqVlf55
	PQ2GtCOIpwn6DceZn06BWcSCrALbNUL9pCBS+XORpppcFcvvWbs3IgkObJUNx6BI0Bu6JLmi9w/cw
	ksZaanAwLMFe2wVAHsWldH2QkB0LCBSiXERMkLQTzv6PurmFcDhAFrU+IPulg28li6rpMpygED/S3
	ZqP0ux6p9U4hwUIGJ9qzjlxhfZYTzQkmiyLDaRwsSzAmw+5+TJu05VhLORXnZ0iNuszRn282FEFAe
	hRDx1XZYqVGrB85+I+W7JBI1Ycube4f/htwYkAzNpW95N0pSSlKtr1aneHa9sSc0qA9dl8Cu4+pg/
	fPE4JTBw==;
Received: from localhost ([::1]:30202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j75aS-00BrEU-OL; Wed, 26 Feb 2020 22:55:28 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:33235) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j75aM-00BrDn-8f
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 22:55:25 +0000
Received: by mail-lf1-x143.google.com with SMTP id n25so589334lfl.0
 for <samba-technical@lists.samba.org>; Wed, 26 Feb 2020 14:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rqak5LzVuAjk3JeKh5e+pRIZmB8x8YKQOpiIZcgpJbY=;
 b=lhtHnfnglNqxsDO2DQL2C6ofebLZvqgGbhj21k+GeK9XzKFh1zq8lMTbudm0qc+oi2
 43ac6X10ff5mzodzKghKXBKg8+snluFrF9bEFvk0fNenZixLHsPKXaI/k7a4aUT4Rjfx
 fkMthpcwAYH9EzsYAJsYZFMwb2vEJfRNbW/FZBnjcIOEQum7XLzv224HtPwYXgTtE3xG
 7oWEJMUnst2wjFGs+fb4nCSbsf/2z5DtnU4gg4yT7SxcNhY96xO+4mnN0JQGHlhEk4W4
 NvXlBQW7IymcN54LOmRtTbIOqoLKbUned/VFoCsLseazxYjTkOqfwPCL9RkaGLiUIC/l
 RnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rqak5LzVuAjk3JeKh5e+pRIZmB8x8YKQOpiIZcgpJbY=;
 b=Aoj6QWLMoNj+G8heLYhKZ88h/o30ipmZ35xDnWB4tF3QpKfvkt8g5d5pSaKsX4+srj
 DW/FJdRawQm217rFWvlQX37x5d0NH0Q1vz+qVbqac4ORp4z7hJcyL58UKo0voSA1qmY9
 y4Qijpkk3gRvUC/TMtMsOpEDyveBHtigILX98lJWl8GlIS6Ixu0fMBlp36heTlyOYC/K
 W0qGgEOfuZNt+PRHaf31Z4Q4LcWLts9MU64bJ6mpPf/Yk9F6ijEFEx/K6VJlFHi7EAqA
 50qwOxZ4GtbKYjKWX1xnya0s/ag71Z4AGrpNE6hfCE8sb6ENadEmpOte7Wy5seZB2egj
 ELPQ==
X-Gm-Message-State: ANhLgQ3IIUWlRjQYgcmcijzSlPh5TJD2h21qKuTmsQYXPCvtcWYeL+Ax
 Pnsaj+dFMs1jbW6W0FZYPeWwaZchT/EE39i9iWllS1pi1Gk=
X-Google-Smtp-Source: ADFU+vtUk05rssFwav10tnNFvNmw/325kgJ7JFFiguJ3WIIWpZNwMZPxcoxE1obgHq4k94f0netVWcSerOBmpj+h+1o=
X-Received: by 2002:a05:6512:1041:: with SMTP id
 c1mr440245lfb.211.1582757717920; 
 Wed, 26 Feb 2020 14:55:17 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8SF+FUQBWxsPnSRtAXEqE=TWBm0Meb8swERSvHqpQf0yw@mail.gmail.com>
 <CAC-fF8SFX0ndOpY2w9zASJd8FagnT_6Mh0Xd4=ejQKQYDcK-uQ@mail.gmail.com>
 <374481b4-af4c-7b0b-cb80-feec96046b53@samba.org>
 <CAC-fF8RVr4qA1HSthHiRn1eaWWxwN=ke8EtfZPMbQmK+Wf+ajQ@mail.gmail.com>
 <CAC-fF8Quxxrx+gaqBMtzaB2zdppJNWUG7OQ70BM_qP4k-b2aMQ@mail.gmail.com>
 <CAC-fF8TonKJ4JTPfxdTueW-pdqqEMAHH0qFkxfy1SLBm2Eme_w@mail.gmail.com>
In-Reply-To: <CAC-fF8TonKJ4JTPfxdTueW-pdqqEMAHH0qFkxfy1SLBm2Eme_w@mail.gmail.com>
Date: Wed, 26 Feb 2020 23:55:06 +0100
Message-ID: <CAC-fF8RxPDyQeVQTfskQdgXMqSfFbBW=cTCWCQy=cKyvh_3GbA@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Debug shows the error is due to wrong input_chan_bindings provided by
ldap server.

This lead me realize the difference between Windows and ldapsearch /
net-ads, is LDAP vs start-tls.
If I use LDAPS in ldapsearch it works fine:
LD_LIBRARY_PATH=/usr/local/lib /usr/local/bin/ldapsearch -H
ldaps://sdc.smb.net -b dc=smb,dc=net cn=administrator -Y GSSAPI -N -O
maxssf=0

So in the start-tls case, the input_chan_bindings provided by the ldap
server seem not right.

