Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 289359ABCEB
	for <lists+samba-technical@lfdr.de>; Wed, 23 Oct 2024 06:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=M5iK0sGkqN1vHqb5AAR5QDaPDbRNycgWWPz/ocOVY4M=; b=I/9nDoOvxpGieO7zhlJm9GBm5m
	u3io4Cy9CaDNUNhYTdns+pz/8FRVXMgV1Ehf/ZdAx28XV1xHSCB3nKcqzt11XwFjRfRfCSgEqsWJO
	wgijvhgXpV7c4fAbwJRxnqtnbSZCheqoHvJ3MEguzyme5Cbb15bgf82sOzPOGYafCzcQt9qUERC2Q
	f9meVqqnhBXSTqZn8rTjNs+lgpZvfrIBfgPLV8M32XSgbEA8sv48vykwRKviHmhFgWpPSOF2/SRBY
	tXGX7/sPX8/Lsre8UiWDLJJcmf7qawESHbo+rEsTOJxOEbyOLxxyoBAM6B2jh8guzT5YZI/pfgOcp
	4iiV0krQ==;
Received: from ip6-localhost ([::1]:38944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t3SuS-004owp-9w; Wed, 23 Oct 2024 04:23:48 +0000
Received: from cat-hlzsim-prod-mail21.catalyst.net.nz
 ([103.250.241.204]:44980) by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t3SuL-004owg-UZ
 for samba-technical@lists.samba.org; Wed, 23 Oct 2024 04:23:45 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail21.catalyst.net.nz (Postfix) with ESMTPSA id AB5AFA9;
 Wed, 23 Oct 2024 17:04:40 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1729656280;
 bh=DSthqcp4+zfJ7Oo5MUkLbVh0ub52F9iihT9W2VuIwRY=;
 h=Date:Subject:References:From:To:In-Reply-To:From;
 b=e+Lmf+Ac5SQQMo7MrUbF8s3odtG0fLBJEraag1Zb0RLhbY6AL2h9dyYX+IZSzsxG7
 aVBJuOPSkgNorJaiak2MpBQ3cfWlWTAAKNsKx5nsj7obb316M9Zr8CiInRvxobASUj
 HJ216QWmfB9BiVIGQFbyxivid9GU2+94rYAhGlZJW2EcYkNRHLpC/SkCxHynvFZMz6
 ZpTqr16o6r0QsUY6VCjROa16EW8e0e6Nm+wt1KhJOlR3LXs3+LyIJ9sJHTTMe1Y9kI
 QIqhCJJtLawvNYiqzV8kyZUFaZgFWfD9dETejVuwNCIMjQGntmAzfn+jssYTZUmKQj
 L0KjDIp+HF9tg==
Message-ID: <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
Date: Wed, 23 Oct 2024 17:04:39 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>,
 Stefan Kania <stefan@kania-online.de>
In-Reply-To: <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hi Stefan,

> 7. Change the condition to disallow access for all user to all computers of the silo
> samba-tool domain auth policy modify --name win11-policy --user-allowed- 
> to-authenticate-to="O:SYG:SYD:(XA;OICI;CR;;;WD;(@USER.example://ext/ 
> AuthenticationSilo != \"win11-silo\"))

The constructed silo attribute always starts with "ad://", as if it were 
a URL prefix, but you have "example://" (you had this right earlier in 
the thread so is perhaps a sanitisation error).

Another possible problem is you have a policy, but the policy is not 
associated to a object. If it was, it would affect that object.

There should be something with the msDS-AssignedAuthNPolicy attribute 
pointing to this policy, and that thing will what members of the 
win11-silo can't log into. The samba-tool command to do that might be 
missing.


> 5. Assign users and computer
> samba-tool domain auth silo member grant --name win11-silo --member=stka
> samba-tool domain auth silo member grant --name win11-silo
> --member=WINCLIENT11\$

I don't think adding "winclient11$" to the silo will make the policy 
apply to other members accessing it. A silo is very much like a group, 
and as with a group, this may just be giving similar rights to stka and 
winclient11.

In fact, the policy could just as easily use a real group, which would 
look something like

   --user-allowed-to-authenticate-to \
     'O:SYG:SYD:(XA;OICI;CR;;;WD;(Not_Member_Of(SID(S-1-2-3-4))))'

which could be useful in debugging.

cheers,
Douglas

