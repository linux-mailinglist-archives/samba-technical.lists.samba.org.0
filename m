Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F761A6E31E
	for <lists+samba-technical@lfdr.de>; Mon, 24 Mar 2025 20:12:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=lbm/8tOzE/1AICYF9GM3IVZ4tatd8hNTwb4eTXBLLe4=; b=xAjsGKET1Sgz+q+DrA0MzfjqRX
	+RhqEiWx8Pr5GmZN+4DR3jTfr7UVhAqdcsV7ICWC2+HhNZfxUH3rNKrgU3RCxsaKTtLvJ4f4SGfmh
	PEGWAjG6nwiwwhpHpDgO7jphp2n/TptOt2gnORscip03S/9DRqEkoTy5e3YB0sq5rx3IXqofrLaVk
	2aee2iSK91sobi9INZgUQDl6EVuv5XLtg1hO17UXGYrG5EjGTc8ZN+xBO/mVusChDuIgjrG3Xks4j
	BVmJQfIhVPQf3tLe+hItNzmM15p9jaue29bFNhJJe2rbmigWUYwkhUdvXGO/v0m2U9X7R2samB0Ni
	kWGN+kMw==;
Received: from ip6-localhost ([::1]:61522 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1twnCh-00GmzU-95; Mon, 24 Mar 2025 19:11:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39200) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1twnCb-00GmzM-Vu
 for samba-technical@lists.samba.org; Mon, 24 Mar 2025 19:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:Date:Message-Id:From:CC;
 bh=2mklLfa+yvgv55Tie8WtfWXuBrG7a2HXkZPSNtNtZW4=; b=N9Q0lWhqM1D0eNMxidycbXWEI2
 aP7Escg965+ut5aTndKF4n7qdSSb8g+fPVzPqRD+7O12fuHwWfteZJemANLg6v2bNxL6xl2IMgAxR
 I//YcYu/M3gVzYl1bNmyzMcfNCv10TTTJHp+OqmCve1Gt0Zdh0qYZa0R/o3BqiqRDHfPj955UkBUl
 vmVLN2ZP10KoDnq6PRbvwZE95zxmX+TMAtoSybes33oKWb2YpexgJ6uFz9exzNM0N4SBMJh+6EtNA
 u+2hOGUvz2yCFQk8bLDddMvE6jbAQPCaUk+kDnaXO8/9vdeM2ijKtVEuB1i1qfvAHLpAH0oGaHHxV
 CnBP5u8DFJlxRGXNpmNCdnjGBGE2djtzvjV9iouFR9FhHjcgFvBJI9yPEbujkdzlBspfZmpFi1HCM
 9s2MgKXRSrMysWBUiMfUIwi0N1KqycB8VqOfQWY/rCklSYTFwVf5+YbJ4V+KFDCzNE7YLZSNhiqxR
 f73QWc+EoqUQSkZ7w/rKPC9+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__ECDSA_SHA256__AES_256_GCM:256) (Exim)
 id 1twnCP-006WWr-13 for samba-technical@lists.samba.org;
 Mon, 24 Mar 2025 19:11:01 +0000
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Project build box
Message-Id: <4272B14A-9CB5-43C3-8EE2-22CE2969A380@samba.org>
Date: Mon, 24 Mar 2025 20:10:50 +0100
To: Samba Technical <samba-technical@lists.samba.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
Content-Type: text/plain;
	charset=utf-8
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
From: Michael Adam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Adam <obnox@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all,

I am writing to introduce my latest hobby/hobbit project buildbox to the =
Samba community in the hope that someone will find it useful or at least =
interesting.

The purpose of buildbox is to provide containerized environments and cli =
tooling for  compiling  software projects and building LaTeX documents =
and slides

The basic idea is to provide container images readily equipped with the =
basic build toolchain to prevent developers from having to modify their =
host with many package installs. Additionally, this allows for more =
deterministic and reproducible build results.

Flavors currently provided are:

Languages:
* C
* LaTeX +beamer=20


OS (Linux distros):
* fedora
* debian
* ubuntu
* opensuse

The code is  located on GitHub: https://github.com/obnoxxx/buildbox

Pre-built images are available on quay.io <http://quay.io/>:
https://quay.io/organization/buildbox=EF=BF=BC



In addition to the mechanism for building container images, the project =
provides a little cli called builbo (yes, it is supposed to sound like =
the hobbit.) for running builds in the corresponding containers.

Bulb is supposed to be invoked from the target project's checkout =
directory which is bind-mounted into the container so that build =
artifacts are created in the project directory on the host.  Builbo can =
take a local build script and names of packages to be installed as build =
dependencies.

Exanple  =E2=80=9Cbulbo -l c -o debian -b -s ./build.sh -d =
"pkg1,pkg2,pkg3=E2=80=9D=20

This uses the Debian cobntainer with C compiler  to build the project in =
the cwd with the script build.sh after installing packages pkg1, pkg2, =
and pkg3.

I have so far successfully used builb to compile a simple project  =
(tinyproxy) and create slide pdfs from latex beamer input.

Currently, I am trying to get samba to build in buildbox.

I am facing the strange problem that configure fails in the containers =
for  all distributions (fedora, opensuse, debian, ubuntu) with the error =
that it can not find Python.h even though the python3-devel or =
python3-dev package is installed.
Interestingly, the same problem does not exist on my Fedora host =
machine.

Any feedback will be highly appreciated as will be any clues regarding =
the configure problem.

Cheers - Michael




=20

