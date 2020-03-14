Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3463318553B
	for <lists+samba-technical@lfdr.de>; Sat, 14 Mar 2020 09:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=IeVDLcjME9gFrklOR3X2aRi377rrnYOKw6ZV7P/mxDA=; b=QlfdzjCiayK8HOLSfNF1fGJ2qo
	FDGr/50ly4mI9st8rO3Z4LFSJ/4V61b7QQEZ3g1tB7wdBtcUX7+07JqhnF7lSFlRNSSZ9UcWCeeDl
	Y7ZAOiscXEprsIrzpWXdS6wo6ArvZRKAJ3rFwmVlFKWc4GB0DL/Fe981HRsShDGZ7w2Mki60HQbFx
	L6gfU+RU5eyD7tR5r5UzCQ12avroZhrZbMUq9FCRmwkmhmuDcBLJmrwVBbQuKAPAZoLe+RIiAf1fp
	D9W2e3eASaEVaMxFR8w1uraH8W3J+WGt1rTFmP/N6L9IpT6iR5/CzK0RAqujB5Da+UZJwigqKJOP5
	aVIWBNoQ==;
Received: from ip6-localhost ([::1]:36666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jD2bL-00G3Ni-S6; Sat, 14 Mar 2020 08:56:59 +0000
Received: from aibo.runbox.com ([91.220.196.211]:36738) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jD2bG-00G3Nb-IS
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 08:56:56 +0000
Received: from [10.9.9.128] (helo=rmmprod06.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <tnagy@waf.io>)
 id 1jD20v-00014j-Qx; Sat, 14 Mar 2020 09:19:21 +0100
Received: from mail by rmmprod06.runbox with local (Exim 4.86_2)
 (envelope-from <tnagy@waf.io>)
 id 1jD20v-0001Go-QB; Sat, 14 Mar 2020 09:19:21 +0100
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received: from [Authenticated alias (664370)] by runbox.com with http
 (RMM6); Sat, 14 Mar 2020 08:19:21 GMT
To: "Jeremy Allison" <jra@samba.org>
Subject: Re: Fighting waf for C preprocessor output.
Date: Sat, 14 Mar 2020 09:19:21 +0100 (CET)
X-RMM-Aliasid: 664370
X-Mailer: RMM6
In-Reply-To: <20200314031555.GA16932@jeremy-acer>
Message-Id: <E1jD20v-0001Go-QB@rmmprod06.runbox>
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
From: Thomas Nagy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Thomas Nagy <tnagy@waf.io>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 13 Mar 2020 20:15:55 -0700, Jeremy Allison via samba-technical <sam=
ba-technical@lists.samba.org> wrote:

> Does anyone know how to make waf generate
> the actual gcc command line it uses to
> compile .c -> .o ?
>=20
> Doing:
>=20
> PYTHONHASHSEED=3D1 WAF_MAKE=3D1  ./buildtools/bin/waf -v build
>=20
> causes it to dump out a python array, bracketed
> by [] characters, but I was hoping not to have
> to fight it any more :-).

Try this instead:
WAF_CMD_FORMAT=3Dstring PYTHONHASHSEED=3D1 WAF_MAKE=3D1  ./buildtools/bin/w=
af -v build

Thomas

