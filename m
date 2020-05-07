Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EDF1C9C58
	for <lists+samba-technical@lfdr.de>; Thu,  7 May 2020 22:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=hh0HAdNsaviVoMLloe/XSc9nUoQ5RHZiJyPWCyK0bKo=; b=NU6Ne9/wAvXADeQWjHZ8cPhohY
	XswG/QLkS2lWQyc+roIuRD3kVWbXLJRpOiPq4QvhU+i5WxD8cgB2Si6Ybtb3uC7z8H/m4riKAOVwl
	q8oukdsKqnvExmTRnetmMLycNnbRKLfR5v2+tHH3RcjJ2slXTqqa+1r6iUExJU7Mr0/fVnJ91t9JK
	HuFHcyh9g+eWv1asRnxSGmh6MOgCxpzR5WykpZ9JKJgNEANBgwJtsST76Tf82vDtfC+hq1nYxl+wh
	ilQG24S8vHxTAzUZrZTa2fgcaOmRnzhPlWJDJGmF08/PPB+7aQ9hxUKPdYD5JbuDS9oKQ3xz8bUtM
	Y9eE77rw==;
Received: from localhost ([::1]:46122 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWn6l-003B4h-Db; Thu, 07 May 2020 20:27:03 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35089) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jWn6d-003B4a-IG
 for samba-technical@lists.samba.org; Thu, 07 May 2020 20:26:59 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B43655C0158
 for <samba-technical@lists.samba.org>; Thu,  7 May 2020 16:26:48 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute4.internal (MEProxy); Thu, 07 May 2020 16:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=artmg.org; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm3; bh=yaESYwnYVHkyfHYilwiDz+e5S7EH/vlyRqGHGpqAt30=; b=CLEUGUWZ
 azqWqDKLcKMhc9iEv1Pwx+VtgUjRSBXcnX1m6FFUqJ34LHwXbelZyfy7VUuMQiRg
 jGUvCYYWhkV5hN3gB3wH2JcXMU57VPcSuN8obnyGtGdP7beTMugeCaZPBTb/s1P4
 cwfqVSCjosyqC/GtoVvdwQlSxeuN2vXcFGoOwqM81wQyq7arHv7I7O3OPY8vsBwp
 2iPHpIxZvLulubK2g4og9dV8jl7/kZQlrEIAapKCum5NCcvn44Dswc9kADmfg/0o
 mMgg1nvfl6WK7VUq4vvrzEnh+ZGpAooX47RVGZMJVvyNeCldXQOTAhJuyfS3UM5/
 VntdRggI9BPuzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=yaESYwnYVHkyfHYilwiDz+e5S7EH/
 vlyRqGHGpqAt30=; b=YcRtb1aAb4fRVRXGyMWTtJM1FhoKVjVEvP+hV8TC6ECpq
 Ao191vagEuhfTrHyz0rXg3D+tcg52oA0ghqsS2B3h3VNdYiKojLOYh4eAM2cKXKG
 F0rVgHa8F+kGHXYvJfYXmxeti7JJXQ+At7Zmwcd+viPIX3x2Vn3l/v1BP70gWauB
 S+WJqYrWkMSYsDkBgZaTLqQgq17/4Qhgnur3g/4nrCKsEZiD89MnUiwJPKXXV5Y0
 qmvVRUTeutNDNr6IIDRJ1JzF4pqlchp8NajH51HD2Nt/cadihKn3P1NdMR37QFrn
 WgBG6wFtwes+KaUsye/UgRHk5wxsOHrmOnO1v0jAg==
X-ME-Sender: <xms:CG-0Xu3RC8lNr80_f1ubYdeuhI0CvPFSL3B-7Iu3oqOS_BTv_YT5JA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedtgddugeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsegrtderre
 erreejnecuhfhrohhmpeetrhhtoffiuceoshhmsghlohgtkhesrghrthhmghdrohhrgheq
 necuggftrfgrthhtvghrnhepvdetfedvteeigfeuieehleeludevgeevheekiedukeffke
 efudeutdeugeegjeegnecuffhomhgrihhnpehsrghmsggrrdhorhhgpdhgihhtlhgrsgdr
 tghomhdpphgrshhtvggsihhnrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepshhmsghlohgtkhesrghrthhmghdrohhrgh
X-ME-Proxy: <xmx:CG-0XiEwvypqW99e0-K_ueB6UttFiuMtxukcajvSUzx1lKfxpP0mkw>
 <xmx:CG-0XqWwjg11sTBWxIddlm4qO_DDXN9NolxZMYgPv4l_LJZH_UlcwA>
 <xmx:CG-0Xi7Mj4PH5raNFsptuMGbrd_zbpIhJCsBM_CH02wf7lYUh4fBxg>
 <xmx:CG-0XmghMHEf8DRkyT4CEY5KTs6JQg-L9V-JU_TacerHJcrvYW9A-Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 66D51C200A5; Thu,  7 May 2020 16:26:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <aec38a69-c8cf-4c3d-89c5-8d24d3a2f710@www.fastmail.com>
Date: Thu, 07 May 2020 21:26:28 +0100
To: samba-technical <samba-technical@lists.samba.org>
Subject: =?UTF-8?Q?no_avahi_after_armhf_build_on_raspbian_-_no_error_but_advertis?=
 =?UTF-8?Q?ing_disappears?=
Content-Type: text/plain
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
From: ArtMG via samba-technical <samba-technical@lists.samba.org>
Reply-To: ArtMG <smblock@artmg.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

When I install Samba from the Raspbian repos and set up a share, the automatic multicast registration (Bonjour announcement) through Avahi works fine. It also works fine when I install Samba from the dev armhf repos kindly supplied by L.P.H.van Belle. 

However, when I compile the project myself from source, I am not managing to get avahi integration working automatically. There are no compile errors that appear of any significance, just a bunch of deprecation warnings.

My steps were:

* fresh build of 2020-02-13-raspbian-buster-lite.zip (latest)
* sudo apt update | dist-upgrade
* install depends from https://git.samba.org/?p=samba.git;a=blob_plain;f=bootstrap/generated-dists/debian10/bootstrap.sh;hb=v4-12-test
 * as directed in https://wiki.samba.org/index.php/Package_Dependencies_Required_to_Build_Samba#Packages_Required_to_Build_Samba
* sudo apt install avahi-daemon
 * already there

```
git clone --single-branch --branch=v4-12-stable --depth=1 https://gitlab.com/samba-team/samba.git
cd samba
./configure
make
sudo make install
```

I have tried the following with ./configure \ 

<nothing>

--without-ad-dc --enable-avahi --enable-debug

 --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc \
 --localstatedir=/var --libdir=/usr/lib/$DEB_HOST_MULTIARCH \
 --with-privatedir=/var/lib/samba/private \
 --with-smbpasswd-file=/etc/samba/smbpasswd \
 --enable-fhs --enable-spotlight --with-systemd \
 --enable-avahi

I even tried all the options LPH mentioned in https://lists.samba.org/archive/samba-technical/2018-October/130648.html

The configure checking looks ok

```
Checking for header avahi-common/watch.h : yes
Checking for header avahi-client/client.h : no
Checking for library avahi-client : no
Checking for avahi_client_new : not found
Checking for macro avahi_client_new : not found
Checking for library avahi-common : yes
Checking for avahi_strerror : ok
```

But whenever I restart my bonjour browser shows no services coming out of avahi. 
For my /var/log/samba/log.smbd (which also tells you my smb.conf) check out https://pastebin.com/p8wiSpGy
I welcome any suggestions of where else to look for diagnostics or ideas to try during configure/make
Thanks, Art
