Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AFBCEADA
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2019 19:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=5IKfG0RXNVmCaO3RDZ7OfGlJtQZLdsDgZKButqm+XBg=; b=e5ptE/ulAby0epS5a+xkwCHX7G
	tCIMdhFm3LnLiOPn2xOv8aF3PTd5YaHaDMUDZlvRjCUTLv5O5UdbI4BLtil8TiJNp2e19md0PBRcP
	fkHZ2hqiEg8R/4VbZJaMI7O+FYcDm/9XE+B3EA48XIOutQ/x5HtGRhUnT3+rBk2izDL8ujhnioZgw
	y67aDoeaLuLgAwTJqfgRYnqy+iPs+4ezqT36y7gvmbhvtJGoE3z9M1XjHJyFe4ibY5Bl6gTFFysTl
	vZ9Kjv9N3UlAi9zL5+uMQg+7WWLDk6BAdvvgMe12Oco8KK7Nf2DlmHcbmC69cxIC+vmrQnIZRWrur
	g71gNjFw==;
Received: from localhost ([::1]:63852 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHX4s-001tJW-PS; Mon, 07 Oct 2019 17:45:46 +0000
Received: from [185.16.48.59] (port=59830 helo=smtp.tranquil.it) 
 by hr1.samba.org with esmtp (Exim) id 1iHX4o-001tJP-Jm
 for samba-technical@lists.samba.org; Mon, 07 Oct 2019 17:45:44 +0000
Received: from mail.tranquil.it (mail.tranquil.it [185.16.48.58])
 by smtp.tranquil.it (Postfix) with ESMTPS id 857B1403E9;
 Mon,  7 Oct 2019 19:45:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1570470337; bh=NL5M5qQdqxtITumUOH2ZF4OsrFAn+NgPCJWtVz3ffCw=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=ZJTkVBeh6cUYsNRhrbbwvOnMuHBtlIcv/Xnvo39+TeytEoGdRHn806LZrWareYYEU
 jyhEh0IBKHEmp3mp14EZ4CFZEx4TODaDymIA6VMIbfL1jUtJuGwyz/outld6hKgoTH
 bNNGqyBpOir43x4VjLgIWJUZBq7ZKiPunKpNUKiE=
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 2947BC8;
 Mon,  7 Oct 2019 19:45:42 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Iie_s66BeI-C; Mon,  7 Oct 2019 19:45:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 86E7A15C;
 Mon,  7 Oct 2019 19:45:41 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id yA3iLorWOpOO; Mon,  7 Oct 2019 19:45:41 +0200 (CEST)
Received: from srvlts1.ad.tranquil.it (bureau-sdsl.tranquil.it [185.16.50.4])
 by mail.tranquil.it (Postfix) with ESMTPSA id 6C22AC8;
 Mon,  7 Oct 2019 19:45:41 +0200 (CEST)
Subject: Re: samba 4.11 rpmbuild on CentOS7
To: Dario Lesca <d.lesca@solinos.it>, samba-technical@lists.samba.org
References: <dcc2c49e-08cd-e077-6506-53020b3ffc58@tranquil.it>
 <d6e33d3f085cd509f2915cc0e50f50572416e169.camel@solinos.it>
 <0091979d-7696-5502-d34d-acd2725bfd36@tranquil.it>
 <5800371.XWyRSs5115@magrathea>
 <ca548b9f-4664-1503-b6ec-f4b04e6e5267@tranquil.it>
 <20191007132204.GL5765@onega.vda.li>
 <af664c35ec71304dfc64639b82054614373b762e.camel@solinos.it>
Message-ID: <e580ee4e-565b-3b03-0626-c1507e64d727@tranquil.it>
Date: Mon, 7 Oct 2019 19:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <af664c35ec71304dfc64639b82054614373b762e.camel@solinos.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
From: Denis Cardon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Denis Cardon <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Dario,

> Il giorno lun, 07/10/2019 alle 16.22 +0300, Alexander Bokovoy via
> samba-technical ha scritto:
>> We worked with Andreas this morning to add CentOS 8 support to Samba
>> CIsystems.
>
> Since the .spec file is the same for centos/redhat/fedosa, I suggest to
> include in the .spec file a flag like this:
> %global with_mit_krb5    1 (or 0 for heimdal)
> in this way people can recompile samba with  Heimdal Kerberos instead
> of MIT without modify .spec file
> Thanks

there are a few other things to take care of, like some files are build=20
only when selecting MIT Kerberos, and some other only when building with=20
Heimdal Kerberos. There are also a few packages that are not yet=20
provided as python3-xxx naming scheme but only with the former EPEL=20
python36-xxx naming scheme. Using transition package could do it. And a=20
few build flags too. But I think it is definitly doable.

@Andreas @Gunter, if you think that a with_heimdal_kdc bcond would be=20
acceptable to switch between MIT and heimdal in a upstream fedora=20
package, I can see at adding the few %if %endif necessary.

Cheers,

Denis



>

--=20
Denis Cardon
Tranquil IT
12 avenue Jules Verne (Bat. A)
44230 Saint S=C3=A9bastien sur Loire (FRANCE)
tel : +33 (0) 240 975 755
http://www.tranquil.it

Tranquil IT recrute! https://www.tranquil.it/nous-rejoindre/
Samba install wiki for Frenchies : https://dev.tranquil.it
WAPT, software deployment made easy : https://wapt.fr

