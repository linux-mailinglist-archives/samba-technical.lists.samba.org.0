Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08B90FCF7
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2024 08:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=K9jfbNWPH86dQNe3bpPSLPD02wnDn1Pq6aNeH3JTzg8=; b=eYuyDNNmE7qrf7Tqr5tMK7R4Ov
	xZvJaDnAIfcMoPIszjueBufALBYqBQ+Cjj2eLdYF8Ks1A5YcLK05s534YYXldgNfSVEVKl66VgEYI
	WkEQyK70EIoPCo5X3uEIQgven38ss2upPTf6TkZf/cgfeD6Iv2oIel8Zv1Aqn8TeujTZ+mt4TyvLw
	ohXRuElnXmjw0Gd1xezxEuaQUUitLUHClogahpDRtvPydKjlao99TEhrpVr1tg9rCKA1Iq6JbTlFK
	mShoOSVkCRtHKjZDaAz1IqR3HlAbsz7P2WEHC0IR7FmbH6vKCWY8795oMw5Tp6LOY8xQDhzZEOdx2
	54dgWOww==;
Received: from ip6-localhost ([::1]:33530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sKBZa-00EaGM-BH; Thu, 20 Jun 2024 06:47:06 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:41071) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sKBZO-00EaGD-Em
 for samba-technical@lists.samba.org; Thu, 20 Jun 2024 06:46:57 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2269672216
 for <samba-technical@lists.samba.org>; Thu, 20 Jun 2024 09:48:08 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 64D3DEDE1F
 for <samba-technical@lists.samba.org>; Thu, 20 Jun 2024 09:46:50 +0300 (MSK)
Message-ID: <7bcfc541-aa5e-4663-a6e0-d21c2b3f3c33@tls.msk.ru>
Date: Thu, 20 Jun 2024 09:46:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ru-RU
To: samba-technical <samba-technical@lists.samba.org>
Subject: vendor version/revision string
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

After Andrew added --vendor-name & --vendor-patch-revision options, I decided to give
it another try to embed downstream (distribution) version info into the binaries
(yes, I know all that stuff were there before too, in a form of VERSION file).

And faced the same old issue which I faced before, when I tried that previously and
failed.

The prob is that --vendor-patch-revision expects just a number.  While in debian,
version string is a string with many words, - even the debian revision "number"
(everything after the upstream version) isn't a number but a string.  For example,
4.17.12+dfsg-0+deb12u1~bpo11+1 - there, --vendor-patch-revision is "0+deb12u1~bpo11+1".
So --vendor-patch-revision can't be used obviously (as it fails right away if something
besides a number is specified).

So I tried to (ab-)use --vendor-name instead, - adding debian version string right to
this one (there's no need to have both options, one is definitely enough).  And while
at first it worked (for a simple version like 4.20.2+dfsg-1), it still fails later during
build process with a version string which contains a tilde, like 4.20.2+dfsg-1~mjt-ubt24 -
it fails at link time because linker script will contain tilde in a symbol name:

SAMBA_4.20.2_UBUNTU_4.20.2_DFSG_1~MJT_UBT24_PRIVATE_SAMBA {
..
}

The wafsamba thing is tough to deal with (it's probably the most uneasy build system in
the world).  I tried this change:

--- a/buildtools/wafsamba/samba_abi.py
+++ b/buildtools/wafsamba/samba_abi.py
@@ -288,3 +288,3 @@ def abi_build_vscript(task):
  def VSCRIPT_MAP_PRIVATE(bld, libname, orig_vscript, version, private_vscript):
-    version = version.replace("-", "_").replace("+","_").upper()
+    version = version.replace("-", "_").replace("+","_").replace("~","_").upper()
      t = bld.SAMBA_GENERATOR(private_vscript,
@@ -317,3 +317,3 @@ def ABI_VSCRIPT(bld, libname, abi_directory, version, vscript, abi_match=None, p
      libname = libname.replace("-", "_").replace("+","_").upper()
-    version = version.replace("-", "_").replace("+","_").upper()
+    version = version.replace("-", "_").replace("+","_").replace("~","_").upper()

(ugly but ok).

This made the build succeed.  However, while whole version string sort of made it
into the executables, there's still a prob in manpages:

Samba 4.20.2-Debian-4.

Yes, it is cut at the first dot.

I'll keep it this way for now, - at least the binaries now properly log whole version
string finally, which is something.

JFYI.

Thanks,

/mjt

-- 
GPG Key transition (from rsa2048 to rsa4096) since 2024-04-24.
New key: rsa4096/61AD3D98ECDF2C8E  9D8B E14E 3F2A 9DD7 9199  28F1 61AD 3D98 ECDF 2C8E
Old key: rsa2048/457CE0A0804465C5  6EE1 95D1 886E 8FFB 810D  4324 457C E0A0 8044 65C5
Transition statement: http://www.corpit.ru/mjt/gpg-transition-2024.txt

