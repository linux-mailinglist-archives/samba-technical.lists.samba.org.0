Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 339B919E9B0
	for <lists+samba-technical@lfdr.de>; Sun,  5 Apr 2020 09:05:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JJQAzq0ax2arX2iwAo5YXAmCHZh6i5Gw6ZZ3O0fFkDY=; b=Ivv9MSsvuULEiJbla0MaMnGq+H
	oznOZ0EpjD4/K0UwaBMOSNgbxSX2Zj6MCgaaggVLjWDbiV9/pfOEcMBlXUTrV6uWaRQPx3Deb/7c/
	Dyr9C0R2tqadc6mnYvsOc2gpiLgV8rmu5vsSsFt4IjRf1IaP+ecisNP/k3Hz6KB6h3f7gdnCpDTs0
	GV2oBm3RZLyRvDQW1HuXOa8LuPQa5TQg15TOpsZRb9nhUWECHBL5ufoZmYggzzuWMhw4XM/QBg5yV
	C8HsEFLN8F4B6ekk9sBz/Wt1KtkLPkAGOx8Wujo9uAsDb2PRSd9G/Vyymy9SyG9Vi4+gJ0YHoTY1Q
	DCphckvA==;
Received: from localhost ([::1]:47316 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jKzKG-003Mto-Qk; Sun, 05 Apr 2020 07:04:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63148) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKzK0-003Mtg-Iq
 for samba-technical@lists.samba.org; Sun, 05 Apr 2020 07:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=JJQAzq0ax2arX2iwAo5YXAmCHZh6i5Gw6ZZ3O0fFkDY=; b=ch/YRSuRvw3vHnwR19TucrpJoF
 0itklAxCgRre1iHKhct3dijZFWrQuutVFBflpiajmkahqea/hF/+mb3YyXDSzH9UUx6SY6kPiJCAX
 ktnerijfy15Eu1UJNBWAWTKQsuOXq5uNGIf64vQqOHEqXJVQtM2qBXgXhf359tQGAvLzDNpqTrBRb
 gO66DftJjYgGrGApwIOyfTkHDGBRkUT41Qr1kTpr1lraWLs6GNtMMV8v+gO/JaXabJCmygvb8k4w0
 GD+zIW/hKGAleQyQulooRBGE4maSQHhoJqiP8VaJ/tqcei4EWIkHCcBGT7+lkbfl2lxpdkApVSSNM
 c6HKS1gnRNVAdmnAqC3GdxBpI2/2yOVUye0FgSvZskpLBZb19oVEgB8YzB9q51Qzyv4abWZOHnLrS
 kKmoweZW7CBuxp6ccjDl/J4aSd7P2LY+RaSZy7D5s2zlXVnwLWTBD9NXap5xSY3hFa3eNa/HNjJST
 RYaZjgVG8j2KXmIS3UqDu2il;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKzJx-0008Do-Ep; Sun, 05 Apr 2020 07:03:54 +0000
Message-ID: <8b233592cbf1e7db6e6aebe4d273fd5a186aa66d.camel@samba.org>
Subject: Re: selftest/flapping: mark samba3.nbt.dgram.netlogon.* as flapping
To: Ralph Boehme <slow@samba.org>, Noel Power <nopower@suse.com>, 
 samba-technical@lists.samba.org, Noel Power <noel.power@suse.com>
Date: Sun, 05 Apr 2020 19:03:49 +1200
In-Reply-To: <abafcbc0-a433-12b1-58d4-011e934b42c3@samba.org>
References: <20200404011303.EF6081400BD@sn.samba.org>
 <7206459d8324b34757339d9d858266c9cbf47303.camel@samba.org>
 <96732fcc-6632-f93d-c075-bec077475165@suse.com>
 <abafcbc0-a433-12b1-58d4-011e934b42c3@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2020-04-04 at 16:54 +0200, Ralph Boehme via samba-technical
wrote:
> Am 4/4/20 um 2:35 PM schrieb Noel Power via samba-technical:
> > interesting, I didn't know that, must say don't recall this one in CI
> > but post these changes this test started flapping more frequently on
> > gitlab CI on the merge branch. But it took 3 attempts I think to get
> > this patchset through on autobuild (all failing on this test) strangely
> > it seems it on the samba-ad-dc-1-mitkrb5 job that it fails in (can't
> > recall seeing it fail on the normal samba-ad-dc either on gitlab or
> > sn-devel)
> 
> fwiw, it was flapping on ad-dc as well quite often in the branch CIs.

There are others in this area, we never understood why:

This flapped in the weekly CI run:
UNEXPECTED(failure): samba3.nbt.dgram.ntlogon(ad_dc)

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



