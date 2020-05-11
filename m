Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7961CE611
	for <lists+samba-technical@lfdr.de>; Mon, 11 May 2020 22:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=k6qSB1m8ocflYZU2Wz3bmqqg87zfFE//KRTwPZS7tdM=; b=duTQcpirtoP1IQd3Qtx4hvJrC3
	b3J7Jw8rYpnhtjIeVy8IyUBa38IQHa0DFfwqY12o+nCxryywlK/ZDOfU6+P5ppPT2PdsAdPTKDKN5
	DFXTQ0xIgD0sRId0kQf20wGjpLZdgUm8iqD0h4NlJa4xaFAQNnjXHBwOoBcOyciIrjPUnmxfhehxh
	o41aDHHP1JP0EruzI+bqKA3MNQTbkpWBnKeCja6KEwqRwt6pwQ4SRFqXRukmpSdN9VABYYcazuBsb
	KQgM8yTYekf++pCdrMxRAq7G+JN3ikrO0gkdgXtsqAOfOrzIFfC5wjERWI4Je69OVsnNoiSRDNlNI
	FYD0mbhg==;
Received: from localhost ([::1]:26582 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYFT5-003tc1-3s; Mon, 11 May 2020 20:56:07 +0000
Received: from mail-ej1-f67.google.com ([209.85.218.67]:44534) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYFSz-003tbu-J9
 for samba-technical@lists.samba.org; Mon, 11 May 2020 20:56:04 +0000
Received: by mail-ej1-f67.google.com with SMTP id x20so5574362ejb.11
 for <samba-technical@lists.samba.org>; Mon, 11 May 2020 13:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k6qSB1m8ocflYZU2Wz3bmqqg87zfFE//KRTwPZS7tdM=;
 b=smi0PWPCc6KY1BYCM+uH70UsEM5hJ9UsEhp67fPp/A09syNGTNQ9rTMCJIAlBBfR3N
 XTRjlYiTrmk4rSItpNu+UI5ahh2YAiJPDvXdXmOMZr47d3n2qx52QV2/AFHLTOqnaUhx
 AA5sb6kuCI/TYwj7GZapaHCPwAg7b19H0MMaR3Rt7Z2QoSfsAVx4WwEDA6Sj1+jamsrg
 7Fc+fjMDHjhSOdEaZtw9sVV+HI6ZufJcpvJWDWrxU+JNYDq3QHj1HZfHQwexhvQqq9nt
 fx4XjyAStJVsjit2vLECI8qTQnhCepVESsevgTMK8HuyGa0TA8eLUXrU7ieEhoWlcfjQ
 Fxaw==
X-Gm-Message-State: AGi0PuZK+z3gEvl8EDEhO2h5iA8jEHUwhOnO8bit6jjqDcp1Q4MGW8sD
 7FRa+s2dPBwaUVCYW9DVmH6W5rOpjWYl10DZ8U4=
X-Google-Smtp-Source: APiQypI085kB9oO2F301pPwuqNNSlgzQ8fQMKA93xbKTAOpJQvAqTVR6H7ylQufefmnjJpDxANa76fzvuODNiZqsyCs=
X-Received: by 2002:a17:906:c348:: with SMTP id
 ci8mr15503680ejb.73.1589230560178; 
 Mon, 11 May 2020 13:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <CALSyjX5G7ps8Pafurh5L+6U_JYBA9uTRxJaEhwKL5jTvU=2ZOQ@mail.gmail.com>
 <20200508222441.4f74c615@samba.org>
 <29c6778ebf0a22d063042589526b98922d06301d.camel@samba.org>
 <CALSyjX7RkiukckU5P1xL4FBX6tWpZFB9E1t0CrO+t+0EwNaNWA@mail.gmail.com>
 <20200510020744.2baaa806@samba.org>
In-Reply-To: <20200510020744.2baaa806@samba.org>
Date: Mon, 11 May 2020 16:55:48 -0400
Message-ID: <CALSyjX46QX3HKUQoZ2oEXCyywRU2kB0KzMGm3_FzRg4tZjPHUA@mail.gmail.com>
Subject: Re: [PATCH] snapper: add configure option to control build (default:
 auto)
To: David Disseldorp <ddiss@samba.org>
Content-Type: multipart/mixed; boundary="00000000000001898605a56593ef"
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
From: Matt Taylor via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Taylor <liverbugg@rinux.org>
Cc: Matt Taylor via samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000001898605a56593ef
Content-Type: text/plain; charset="UTF-8"

On Sat, May 9, 2020 at 8:07 PM David Disseldorp <ddiss@samba.org> wrote:
>
> Hi Matt,
>
> There's some white-space damage below the new samba_add_onoff_option
> line. The empty line between snapper and cephfs should also be removed.
>
> Otherwise this looks fine to me:
> Reviewed-by: David Disseldorp <ddiss@samba.org>
>
> I expect the new default dbus dependency will catch a few people, but
> the clear instructions on how to disable it should help.
>
> As with your other patch, please use git format with a commit message
> and sign off.
> See https://wiki.samba.org/index.php/Contribute#Mailing_patches_to_samba-technical
>

I've removed the extra white space.  I think I did this correctly,
it's my first time using git to try to submit a patch.

Thank you for reviewing and working with me on this.

-Matt

--00000000000001898605a56593ef
Content-Type: text/plain; charset="US-ASCII"; name="samba-snapper_option.patch2.txt"
Content-Disposition: attachment; filename="samba-snapper_option.patch2.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_ka2yppkm0>
X-Attachment-Id: f_ka2yppkm0

RnJvbSA0ZGQ1YjFhZTc0MTU5MjM1NTUzY2UwYzhhOWY1YjhkZmEwNzZjZDExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXR0IFRheWxvciA8bGl2ZXJidWdnQHJpbnV4Lm9yZz4KRGF0
ZTogTW9uLCAxMSBNYXkgMjAyMCAxNToyNjo0MSAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIHNuYXBw
ZXI6IGFkZCBjb25maWd1cmUgb3B0aW9uIHRvIGNvbnRyb2wgYnVpbGQgKGRlZmF1bHQ6IHRydWUp
CgpTaWduZWQtb2ZmLWJ5OiBNYXR0IFRheWxvciA8bGl2ZXJidWdnQHJpbnV4Lm9yZz4KLS0tCiBz
b3VyY2UzL3dzY3JpcHQgfCAxMiArKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291cmNlMy93c2NyaXB0IGIv
c291cmNlMy93c2NyaXB0CmluZGV4IDc2YWJjZjc5YzkwLi5jNTBmZDJiYzRkOSAxMDA2NDQKLS0t
IGEvc291cmNlMy93c2NyaXB0CisrKyBiL3NvdXJjZTMvd3NjcmlwdApAQCAtNzQsNiArNzQsNyBA
QCBkZWYgb3B0aW9ucyhvcHQpOgogCiAgICAgb3B0LnNhbWJhX2FkZF9vbm9mZl9vcHRpb24oJ2ds
dXN0ZXJmcycsIHdpdGhfbmFtZT0iZW5hYmxlIiwgd2l0aG91dF9uYW1lPSJkaXNhYmxlIiwgZGVm
YXVsdD1UcnVlKQogICAgIG9wdC5zYW1iYV9hZGRfb25vZmZfb3B0aW9uKCdjZXBoZnMnLCB3aXRo
X25hbWU9ImVuYWJsZSIsIHdpdGhvdXRfbmFtZT0iZGlzYWJsZSIsIGRlZmF1bHQ9VHJ1ZSkKKyAg
ICBvcHQuc2FtYmFfYWRkX29ub2ZmX29wdGlvbignc25hcHBlcicsIHdpdGhfbmFtZT0iZW5hYmxl
Iiwgd2l0aG91dF9uYW1lPSJkaXNhYmxlIiwgZGVmYXVsdD1UcnVlKQogCiAgICAgb3B0LmFkZF9v
cHRpb24oJy0tZW5hYmxlLXZ4ZnMnLAogICAgICAgICAgICAgICAgICAgaGVscD0oImVuYWJsZSBz
dXBwb3J0IGZvciBWeEZTIChkZWZhdWx0PW5vKSIpLApAQCAtMTc1MiwxMSArMTc1MywxNiBAQCBt
YWluKCkgewogICAgIGlmIE9wdGlvbnMub3B0aW9ucy5lbmFibGVfdnhmczoKICAgICAgICAgY29u
Zi5ERUZJTkUoJ0hBVkVfVlhGUycsICcxJykKIAotICAgIGlmIGNvbmYuQ0hFQ0tfQ0ZHKHBhY2th
Z2U9J2RidXMtMScsIGFyZ3M9Jy0tY2ZsYWdzIC0tbGlicycsCisgICAgaWYgT3B0aW9ucy5vcHRp
b25zLndpdGhfc25hcHBlcjoKKyAgICAgICAgaWYgY29uZi5DSEVDS19DRkcocGFja2FnZT0nZGJ1
cy0xJywgYXJncz0nLS1jZmxhZ3MgLS1saWJzJywKICAgICAgICAgICAgICAgICAgICAgICBtc2c9
J0NoZWNraW5nIGZvciBkYnVzJywgdXNlbGliX3N0b3JlPSJEQlVTLTEiKToKLSAgICAgICAgaWYg
KGNvbmYuQ0hFQ0tfSEVBREVSUygnZGJ1cy9kYnVzLmgnLCBsaWI9J2RidXMtMScpCisgICAgICAg
ICAgICBpZiAoY29uZi5DSEVDS19IRUFERVJTKCdkYnVzL2RidXMuaCcsIGxpYj0nZGJ1cy0xJykK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW5kIGNvbmYuQ0hFQ0tfTElC
KCdkYnVzLTEnLCBzaGxpYj1UcnVlKSk6Ci0gICAgICAgICAgICBjb25mLkRFRklORSgnSEFWRV9E
QlVTJywgJzEnKQorICAgICAgICAgICAgICAgIGNvbmYuREVGSU5FKCdIQVZFX0RCVVMnLCAnMScp
CisgICAgICAgIGVsc2U6CisgICAgICAgICAgICBjb25mLmZhdGFsKCJ2ZnNfc25hcHBlciBpcyBl
bmFibGVkIGJ1dCBwcmVyZXF1aXNpdGUgREJVUyBsaWJyYXJpZXMgIgorICAgICAgICAgICAgICAg
ICAgICAgICAib3IgaGVhZGVycyBub3QgZm91bmQuIFVzZSAtLWRpc2FibGUtc25hcHBlciB0byBk
aXNhYmxlICIKKyAgICAgICAgICAgICAgICAgICAgICAgInZmc19zbmFwcGVyIHN1cHBvcnQuIik7
CiAKICAgICBpZiBjb25mLkNIRUNLX0NGRyhwYWNrYWdlPSdsaWJ1cmluZycsIGFyZ3M9Jy0tY2Zs
YWdzIC0tbGlicycsCiAgICAgICAgICAgICAgICAgICAgICAgbXNnPSdDaGVja2luZyBmb3IgbGli
dXJpbmcgcGFja2FnZScsIHVzZWxpYl9zdG9yZT0iVVJJTkciKToKLS0gCjIuMjYuMgoK
--00000000000001898605a56593ef--

