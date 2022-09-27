Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E2F5ECDF9
	for <lists+samba-technical@lfdr.de>; Tue, 27 Sep 2022 22:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ZQtMAdLK9blsIXaObudtxlvNOFPLDwbIvhIN76atu4Q=; b=QKQBxBnaAzvJRTvmeOKnmYFF6V
	HzM5HJ5SrTVTrXj9w9b48TZZ047aA6cE6WpB1gP1v0cWITeA+gIWGS4UVAekcqKq1SI1mU0hq+k4s
	dHJcK++2Qww9/i+kJkqjj0JD+TqNRTcmL2r8b5ENfWIRxLzN6zq2IqFvAKyhXRTRr4615VIM418yp
	FqE3y0FblFbHWM7h61u2hCxWuwFKtuhNepBwOV6SokPt7/n3Dneiq/kdbaGPp6c0SfXeUGrCFYz9f
	C7jo3jUFPTHPTFNmenwGo0X/GeAVjSDdovngtNdHtGMsS6pm0R4MOwO1Txn7+DQREQeoXLAx/xRUa
	cijleLGw==;
Received: from ip6-localhost ([::1]:42194 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odGud-004QQJ-Lz; Tue, 27 Sep 2022 20:10:39 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44544) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1odGuR-004QQA-Rd
 for samba-technical@lists.samba.org; Tue, 27 Sep 2022 20:10:36 +0000
Received: by mail-ej1-x62d.google.com with SMTP id r18so22964289eja.11
 for <samba-technical@lists.samba.org>; Tue, 27 Sep 2022 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=puzzle-itc.de; s=google;
 h=content-language:subject:organization:from:cc:to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date;
 bh=ZQtMAdLK9blsIXaObudtxlvNOFPLDwbIvhIN76atu4Q=;
 b=Ugygq5uedJbLhAoKKU3kpVAgGXUv4PsKpgsbnP7M+D9kPufEvLHCo0WZvN9psAwht0
 cbQ4MILfGHWiJ56gD58LrkUVd66Mv4to6AZKYXJpDdkZqwLWaqgdzAMqWIF99nD4euGn
 c5Qge7+1DQJi+D1OzPKlBV4Fmi2eKFvr4+pVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-language:subject:organization:from:cc:to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date;
 bh=ZQtMAdLK9blsIXaObudtxlvNOFPLDwbIvhIN76atu4Q=;
 b=GUGIu0X+FFtD1UQ01UvXO0qeq9mU+u2aCTkl9ZPUWCnI0lYl6r++EoOigUud70vA56
 dg6COEKtgJO7KjR3iVJ53bCOW0SiKfDD6Bz9MGb3TsEd9bpW9/Jl7ZVmMgXoyOGC6KHM
 n4pqPSqADo0qbrHJZ9U+uoSyKbKUFB3N+DHIle1b6Gg/t7WZ+EMQlNUx66sHeqXEKxZE
 gQy4MQf0Pik8sih5morUhjByD9mXnIDof8hR7r56fK0mnwFhRShDPl6XQd/GdldQjWoA
 MTRMPgsg4N2xIhDH8Q6dRe9jU7UHftvFu2cApyy8n8VbwnFWzm0XTjBqvujBeblspAvA
 rAfA==
X-Gm-Message-State: ACrzQf3K2WyiwlPgk3j+s4/cB4iKRjgmuCGtdRC9J6f+KqI+Vpn1Shnw
 foy4PVvs3Fk4QzpEqbkSO0Pf9+YwBParmqr24wG3S8N8Nbw10qkUzr6qIUUdB5rUys0rN0nCVrI
 9Oa5ucT+2efg04hY1+SAiKeYyzL1MSQ==
X-Google-Smtp-Source: AMsMyM7ZPI9ZQgyN8bXry4c7ISRW3M/5ELyDGkXNeEdwwwgFSXYofkdcNFmLMl7UzUwa2JXF/HLrXg==
X-Received: by 2002:a17:907:a05c:b0:772:eb61:904b with SMTP id
 gz28-20020a170907a05c00b00772eb61904bmr24805182ejc.237.1664309423028; 
 Tue, 27 Sep 2022 13:10:23 -0700 (PDT)
Received: from ?IPV6:2a02:8070:8884:cd80:986f:904:182f:683e?
 ([2a02:8070:8884:cd80:986f:904:182f:683e])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a170906540900b0073d7b876621sm1255264ejo.205.2022.09.27.13.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 13:10:22 -0700 (PDT)
Message-ID: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
Date: Tue, 27 Sep 2022 22:10:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: samba-technical@lists.samba.org
Organization: Puzzle ITC Deutschland GmbH
Subject: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Content-Type: multipart/mixed; boundary="------------ev40GUOtD81w7nQtsk40uJos"
Content-Language: en-US
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
From: Daniel Kobras via samba-technical <samba-technical@lists.samba.org>
Reply-To: Daniel Kobras <kobras@puzzle-itc.de>
Cc: Michael Weiser <michael.weiser@atos.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------ev40GUOtD81w7nQtsk40uJos
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all!


The attached patch restricts the extended attributes that Samba exposes
to clients as Windows EAs to the 'user' namespace in the local
filesystem. This is a potentially user-visible change, and Jeremy
suggested I put this up here for comments and discussion first.

Gory details can be found in a recent thread on the samba list[0], and
the related bug report[1], quick summary here:

Samba maps all Windows EA to EA names below the 'user' namespace in the
local filesystem, but in the opposite direction, it exposes all EA
namespaces (except 'system' and some EAs reserved for internal use) to
Windows EAs. The 'user.' prefix is stripped, all other names are passed
verbatim. For EAs outside the 'user' namespace, this leads to potential
collisions ('foo.bar' and 'user.foo.bar' map to the same Windows EA),
and renames those EAs if a file is copied via Samba ('foo.bar' on the
original file becomes 'user.foo.bar' in the clone). The latter may lead
to subtle and misleading errors if the 'user' EA namespace is disabled
(mount option 'user_xattr' not set).

The issues can be avoided with a consistent mapping between Windows EAs
and the 'user' namespace in both directions, ie. no longer present EAs
outside of 'user' as Windows EAs in SMB_INFO_QUERY_ALL_EAS and friends.
Do you agree with this approach? Are there applications that rely on
the current mapping of non-user EAs? Please let me know if I should
submit the patch as a proper MR.

Kind regards,

Daniel

[0] https://lists.samba.org/archive/samba/2022-September/241918.html
[1] https://bugzilla.samba.org/show_bug.cgi?id=3D15186
--=20
Daniel Kobras
Principal Architect
Puzzle ITC Deutschland
+49 7071 14316 0
www.puzzle-itc.de
--=20
Puzzle ITC Deutschland GmbH
Sitz der Gesellschaft: Eisenbahnstra=C3=9Fe 1, 72072=20
T=C3=BCbingen

Eingetragen am Amtsgericht Stuttgart HRB 765802
Gesch=C3=A4ftsf=C3=BChrer:=20
Lukas Kallies, Daniel Kobras, Mark Pr=C3=B6hl


--------------ev40GUOtD81w7nQtsk40uJos
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-s3-smbd-Consistently-map-EAs-to-user-namespace.patch"
Content-Disposition: attachment;
 filename*0="0001-s3-smbd-Consistently-map-EAs-to-user-namespace.patch"
Content-Transfer-Encoding: base64

RnJvbSBiYjNjNTBmYmM0MWZmZGUxODYzY2IxMWI4MmU0NmZkMjBkZjlmMWFmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBEYW5pZWwgS29icmFzIDxrb2JyYXNAcHV6emxlLWl0
Yy5kZT4KRGF0ZTogTW9uLCAyNiBTZXAgMjAyMiAxMDoyNzoxOSArMDIwMApTdWJqZWN0OiBb
UEFUQ0hdIHMzOiBzbWJkOiBDb25zaXN0ZW50bHkgbWFwIEVBcyB0byB1c2VyIG5hbWVzcGFj
ZQoKU2FtYmEgaGFzIGFsd2F5cyBiZWVuIG1hcHBpbmcgV2luZG93cyBFQXMgdG8gdGhlICd1
c2VyJyBuYW1lc3BhY2Ugb24gdGhlClBPU0lYIHNpZGUuIEhvd2V2ZXIsIGluIHRoZSBvcHBv
c2l0ZSBkaXJlY3Rpb24sIHRoZSBtYXBwaW5nIHdvdWxkIGFsc28gbWFwCm90aGVyIHVzZXIt
cmVhZGFibGUgUE9TSVggRUEgbmFtZXNwYWNlcyB0byBXaW5kb3dzIEVBcywgb25seSBzdHJp
cHBpbmcgdGhlCid1c2VyJyBuYW1lc3BhY2UgcHJlZml4LCBhbmQgcGFzc2luZyBhbGwgb3Ro
ZXIgRUEgbmFtZXMgdmVyYmF0aW0uCgpUaGlzIG1lYW5zIGFueSBQT1NJWCBFQSAnb3RoZXIu
Zm9vJyBjb2xsaWRlcyB3aXRoICd1c2VyLm90aGVyLmZvbycgb24gdGhlCldpbmRvd3Mgc2lk
ZSwgaGVuY2UgdGhlIG1hcHBpbmcgb2Ygbm9uLXVzZXIgbmFtZXNwYWNlcyBpcyB1bnJlbGlh
YmxlLgpBbHNvLCBjb3B5IG9wZXJhdGlvbnMgdmlhIFdpbmRvd3Mgd291bGQgcmVuYW1lIGFu
IGV4aXN0aW5nIFBPU0lYIEVBCidvdGhlci5mb28nIGluIHRoZSBzb3VyY2UgZmlsZSB0byAn
dXNlci5vdGhlci5mb28nIGluIHRoZSBkZXN0aW5hdGlvbi4gVGhlCid1c2VyJyBuYW1lc3Bh
Y2UsIGhvd2V2ZXIsIG1heSBub3QgYmUgZW5hYmxlZCBvbiB0aGUgdW5kZXJseWluZyBmaWxl
c3lzdGVtLApsZWFkaW5nIHRvIHN1YnRsZSBmYWlsdXJlIG1vZGVzIGxpa2UgdGhlIG9uZXMg
cmVwb3J0ZWQgaW4gZWcuCjxodHRwczovL2J1Z3ppbGxhLnNhbWJhLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MTUxODY+CgpGaXggdGhlIGlzc3VlcyBieSByZXN0cmljdGluZyB0aGUgbWFwcGlu
ZyB0byB0aGUgJ3VzZXInIFBPU0lYIEVBIG5hbWVzcGFjZQpjb25zaXN0ZW50bHkgZm9yIGVp
dGhlciBkaXJlY3Rpb24uCgpCVUc6IGh0dHBzOi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3df
YnVnLmNnaT9pZD0xNTE4NgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIEtvYnJhcyA8a29icmFz
QHB1enpsZS1pdGMuZGU+Ci0tLQogc291cmNlMy9zbWJkL3NtYjJfdHJhbnMyLmMgfCAyMyAr
KysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291cmNlMy9zbWJkL3NtYjJfdHJh
bnMyLmMgYi9zb3VyY2UzL3NtYmQvc21iMl90cmFuczIuYwppbmRleCA5NWNlY2NlOTZlMS4u
NjlmNjE4NGJmZjEgMTAwNjQ0Ci0tLSBhL3NvdXJjZTMvc21iZC9zbWIyX3RyYW5zMi5jCisr
KyBiL3NvdXJjZTMvc21iZC9zbWIyX3RyYW5zMi5jCkBAIC00NTQsNyArNDU0LDE5IEBAIHN0
YXRpYyBOVFNUQVRVUyBnZXRfZWFfbGlzdF9mcm9tX2ZzcChUQUxMT0NfQ1RYICptZW1fY3R4
LAogCQlzdHJ1Y3QgZWFfbGlzdCAqbGlzdHA7CiAJCWZzdHJpbmcgZG9zX2VhX25hbWU7CiAK
LQkJaWYgKHN0cm5lcXVhbChuYW1lc1tpXSwgInN5c3RlbS4iLCA3KQorCQkvKgorCQkgKiBQ
T1NJWCBFQSBuYW1lcyBhcmUgZGl2aWRlZCBpbnRvIHNldmVyYWwgbmFtZXNwYWNlcyBieQor
CQkgKiBtZWFucyBvZiBzdHJpbmcgcHJlZml4ZXMuIFVzdWFsbHksIHRoZSBzeXN0ZW0gY29u
dHJvbHMKKwkJICogc2VtYW50aWNzIGZvciBlYWNoIG5hbWVzcGFjZSwgYnV0IHRoZSAndXNl
cicgbmFtZXNwYWNlIGlzCisJCSAqIGF2YWlsYWJsZSBmb3IgYXJiaXRyYXJ5IHVzZSwgd2hp
Y2ggY29tZXMgY2xvc2VzdCB0bworCQkgKiBXaW5kb3dzIEVBIHNlbWFudGljcy4gSGVuY2Us
IHdlIG1hcCBQT1NJWCBFQXMgZnJvbSB0aGUKKwkJICogJ3VzZXInIG5hbWVzcGFjZSB0byBX
aW5kb3dzIEVBcywgYW5kIGp1c3QgaWdub3JlIGFsbCB0aGUKKwkJICogb3RoZXIgbmFtZXNw
YWNlcy4gQWxzbywgYSBmZXcgc3BlY2lmaWMgbmFtZXMgaW4gdGhlICd1c2VyJworCQkgKiBu
YW1lc3BhY2UgYXJlIHVzZWQgYnkgU2FtYmEgaW50ZXJuYWxseS4gRmlsdGVyIHRoZW0gb3V0
IGFzCisJCSAqIHdlbGwsIGFuZCBvbmx5IHByZXNlbnQgdGhlIEVBcyB0aGF0IGFyZSBhdmFp
bGFibGUgZm9yCisJCSAqIGFyYml0cmFyeSB1c2UuCisJCSAqLworCQlpZiAoIXN0cm5lcXVh
bChuYW1lc1tpXSwgInVzZXIuIiwgNSkKIAkJICAgIHx8IHNhbWJhX3ByaXZhdGVfYXR0cl9u
YW1lKG5hbWVzW2ldKSkKIAkJCWNvbnRpbnVlOwogCkBAIC03ODAsNyArNzkyLDE0IEBAIE5U
U1RBVFVTIHNldF9lYShjb25uZWN0aW9uX3N0cnVjdCAqY29ubiwgZmlsZXNfc3RydWN0ICpm
c3AsCiAJCWludCByZXQ7CiAJCWZzdHJpbmcgdW5peF9lYV9uYW1lOwogCi0JCWZzdHJjcHko
dW5peF9lYV9uYW1lLCAidXNlci4iKTsgLyogQWxsIEVBJ3MgbXVzdCBzdGFydCB3aXRoIHVz
ZXIuICovCisJCS8qCisJCSAqIENvbXBsZW1lbnRpbmcgdGhlIGZvcndhcmQgbWFwcGluZyBm
cm9tIFBPU0lYIEVBcyB0bworCQkgKiBXaW5kb3dzIEVBcyBpbiBnZXRfZWFfbGlzdF9mcm9t
X2ZzcCgpLCBoZXJlIHdlIG1hcCBpbiB0aGUKKwkJICogb3Bwb3NpdGUgZGlyZWN0aW9uIGZy
b20gV2luZG93cyBFQXMgdG8gdGhlICd1c2VyJyBuYW1lc3BhY2UKKwkJICogb2YgUE9TSVgg
RUFzLiBIZW5jZSwgYWxsIFBPU0lYIEVBIG5hbWVzIHRoZSB3ZSBzZXQgaGVyZSBtdXN0CisJ
CSAqIHN0YXJ0IHdpdGggYSAndXNlci4nIHByZWZpeC4KKwkJICovCisJCWZzdHJjcHkodW5p
eF9lYV9uYW1lLCAidXNlci4iKTsKIAkJZnN0cmNhdCh1bml4X2VhX25hbWUsIGVhX2xpc3Qt
PmVhLm5hbWUpOwogCiAJCWNhbm9uaWNhbGl6ZV9lYV9uYW1lKGZzcCwgdW5peF9lYV9uYW1l
KTsKLS0gCjIuMjUuMQoK

--------------ev40GUOtD81w7nQtsk40uJos--

