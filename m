Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CCD3FC018
	for <lists+samba-technical@lfdr.de>; Tue, 31 Aug 2021 02:47:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3y+Q7ucPUT+WxBJ4fmSMmi89ktmQPH0y9F+OckjF8eE=; b=miG5Cr10bRJlzJWwby9rIKOIiH
	wim2Xv87/SIDJMECOFvm+Ai0vyZXITFjAUDI24HzKUiQu9+gl7BSsgt3QkujosAeLHaqUBeh2B4e6
	rJeXFw2XSJjUz1Wsv8uXxvip7DtVx4DNMOh6iXtii/9Cu8ourcdjsVWF7wlqPPdL8O6FEsp2VsmNu
	rQWuwG0357aR+5x8F5cXmjIB813a9Sav/k9iwRyDf+Ypj0y2jG3/hFLObGg9rwkZiY/hpnPLycJvi
	07qPJznCei1fldCNX2MG+95ClT/y6f7F7/XBSLU8bboCjIIz4MyyGycDirCSok+hKjTnzJlQ4g8VC
	Jw69Jntw==;
Received: from ip6-localhost ([::1]:62360 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mKruD-00A3FN-5p; Tue, 31 Aug 2021 00:45:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20396) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mKru4-00A3FE-SQ
 for samba-technical@lists.samba.org; Tue, 31 Aug 2021 00:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=3y+Q7ucPUT+WxBJ4fmSMmi89ktmQPH0y9F+OckjF8eE=; b=N7N0vazuzSy826UInG8k9c/4NP
 4M//Px+qAtf1qlnZtWGHSOfgf49Hda+4+bMiqqq5okDLYnZgB8XeXt6JkWmqUOoFkH7nOGEFehDuz
 m2J/5MlUGOexCRZpdnyVxu2+AxlnX+VdgKfaCmhsAXXhZvFxkKjuoNUoZPpuIE18gVcrTui5+Hq3G
 1AGsCG/ygZcZlYDtv8EyiekfYJMzHQZhZc5wh1rfjZUMencvqIlYVMRenDD93FxAgsSM6d8BUp1l+
 WTZ0nockMq0Vj0zEG/EaCiMJL+b96ZCfmX0rXL48E/+BabwHMwafGxR8FT/NFhCu685evoK5aaQFu
 Vyy1RNZWF1mC2SPgNbjvFu7hmdGVJMJqJqBL0ITxs480mRm9UxtsFeo6MPSpvTAOyIHkU/RELV17g
 BE//xummih9SXBUlwNk0mneeZLVxVYhic8SZvyIzWTVMWKzHdv0SwmbE4fYY+FvyQ68MBUSCyisUL
 peG3vfyccPkP6ItqASWedV9u;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mKrtz-003lrp-U3
 for samba-technical@lists.samba.org; Tue, 31 Aug 2021 00:45:24 +0000
Message-ID: <f1c26018957975b1ae6fc291d516fe8098e5c182.camel@samba.org>
Subject: A warning on setUpClass in our python tests
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 31 Aug 2021 12:45:18 +1200
Content-Type: multipart/mixed; boundary="=-QL51BX7pPiLpgMNCjpTS"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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


--=-QL51BX7pPiLpgMNCjpTS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I wanted to use setUpClass() to create once a user account for some
tests (user_account_control.py), to avoid making a user over and over
again.

However it is important to note that unless the test is under
python/samba/tests and loaded with planpythontestsutie any exceptions
raised in the setUpClass() are not caught.

The result is that ALL THE TESTS ARE SILENTLY SKIPPED.

Not ideal.  Thankfully we don't do this, but there is a real risk that
we might have a testsuite that silently vanishes.  The official docs
don't mention this here:
https://docs.python.org/3/library/unittest.html#setupclass-and-teardownclass

Hoever there is this note here:
https://docs.python.org/3/library/unittest.html#class-and-module-fixtures
which indicates that a _ErrorHolder object is created.  We might need
to find a way to locate that if we don't just move away from tests as
executable scripts.

Others have seen this (trying to skip):
https://github.com/CleanCut/green/discussions/215#discussioncomment-188017

Their monkey-patch looks horrible:
https://github.com/CleanCut/green/commit/9f393edcaacc838bf3635f84a83537a6c7ce045b

But vaugely mention that _Error

Medium term it would be really good if, source4/dsdb/tests/python was
moved to python/samba/tests/dsdb and the invocations changes to use
planpythontestsuite, as it works there.

(BTW, with Python 3.8 we gain addClassCleanup() which would be
helpful). 

TLDR: avoid setUpClass unless using planpythontestuite.


Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions

--=-QL51BX7pPiLpgMNCjpTS
Content-Disposition: attachment; filename="setUpClass.patch"
Content-Type: text/x-patch; name="setUpClass.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdXJjZTQvZHNkYi90ZXN0cy9weXRob24vdXNlcl9hY2NvdW50X2NvbnRy
b2wucHkgYi9zb3VyY2U0L2RzZGIvdGVzdHMvcHl0aG9uL3VzZXJfYWNjb3VudF9jb250cm9sLnB5
CmluZGV4IDk3YTVlYThlMzVmLi5jODczZDU2MmRkYyAxMDA3NTUKLS0tIGEvc291cmNlNC9kc2Ri
L3Rlc3RzL3B5dGhvbi91c2VyX2FjY291bnRfY29udHJvbC5weQorKysgYi9zb3VyY2U0L2RzZGIv
dGVzdHMvcHl0aG9uL3VzZXJfYWNjb3VudF9jb250cm9sLnB5CkBAIC00Nyw2ICs0Nyw4IEBAIHBh
cnNlciA9IG9wdHBhcnNlLk9wdGlvblBhcnNlcigidXNlcl9hY2NvdW50X2NvbnRyb2wucHkgW29w
dGlvbnNdIDxob3N0PiIpCiBzYW1iYW9wdHMgPSBvcHRpb25zLlNhbWJhT3B0aW9ucyhwYXJzZXIp
CiBwYXJzZXIuYWRkX29wdGlvbl9ncm91cChzYW1iYW9wdHMpCiBwYXJzZXIuYWRkX29wdGlvbl9n
cm91cChvcHRpb25zLlZlcnNpb25PcHRpb25zKHBhcnNlcikpCitzdWJ1bml0b3B0cyA9IFN1YnVu
aXRPcHRpb25zKHBhcnNlcikKK3BhcnNlci5hZGRfb3B0aW9uX2dyb3VwKHN1YnVuaXRvcHRzKQog
CiAjIHVzZSBjb21tYW5kIGxpbmUgY3JlZHMgaWYgYXZhaWxhYmxlCiBjcmVkb3B0cyA9IG9wdGlv
bnMuQ3JlZGVudGlhbHNPcHRpb25zKHBhcnNlcikKQEAgLTEwOCw2ICsxMTAsMzcgQEAgY2xhc3Mg
VXNlckFjY291bnRDb250cm9sVGVzdHMoc2FtYmEudGVzdHMuVGVzdENhc2UpOgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiaXRfc3RyLCBiaXQsIGJpdF9zdHIpCiAKIAor
ICAgICMgT25seSBtYWtlIHRoZSB1bnByaXZpbGVnZWQgdXNlciBvbmNlLCBhdm9pZGluZyBjcmVh
dGluZyBvbmUgcGVyCisgICAgIyBjb21iaW5hdGlvbiBhYm92ZS4KKyAgICBAY2xhc3NtZXRob2QK
KyAgICBkZWYgc2V0VXBDbGFzcyhjbHMpOgorCisgICAgICAgIHN1cGVyKCkuc2V0VXBDbGFzcygp
CisgICAgICAgIGNscy5hZG1pbl9zYW1kYiA9IHNhbWJhLnNhbWRiLlNhbURCKHVybD1sZGFwaG9z
dCwgbHA9bHAsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNl
c3Npb25faW5mbz1zeXN0ZW1fc2Vzc2lvbigpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjcmVkZW50aWFscz1jcmVkcykKKworICAgICAgICBjbHMuZG9tYWlu
X3NpZCA9IHNlY3VyaXR5LmRvbV9zaWQoY2xzLmFkbWluX3NhbWRiLmdldF9kb21haW5fc2lkKCkp
CisgICAgICAgIGNscy5iYXNlX2RuID0gY2xzLmFkbWluX3NhbWRiLmRvbWFpbl9kbigpCisgICAg
ICAgIAorICAgICAgICBjbHMudW5wcml2X3VzZXIgPSAidGVzdHVzZXIxIgorICAgICAgICBjbHMu
dW5wcml2X3VzZXJfcHcgPSAic2FtYmExMjNAIgorCisgICAgICAgIGRlbGV0ZV9mb3JjZShjbHMu
YWRtaW5fc2FtZGIsICJDTj0lcyxDTj1Vc2VycywlcyIgJSAoY2xzLnVucHJpdl91c2VyLCBjbHMu
YmFzZV9kbikpCisKKyAgICAgICAgY2xzLmFkbWluX3NhbWRiLm5ld3VzZXIoY2xzLnVucHJpdl91
c2VyLCBjbHMudW5wcml2X3VzZXJfcHcpCisgICAgICAgIHJlcyA9IGNscy5hZG1pbl9zYW1kYi5z
ZWFyY2goIkNOPSVzLENOPVVzZXJzLCVzIiAlIChjbHMudW5wcml2X3VzZXIsIGNscy5hZG1pbl9z
YW1kYi5kb21haW5fZG4oKSksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNjb3BlPVNDT1BFX0JBU0UsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGF0dHJzPVsib2JqZWN0U2lkIl0pCisKKyAgICAgICAgY2xzLnVucHJpdl91c2VyX3NpZCA9IG5k
cl91bnBhY2soc2VjdXJpdHkuZG9tX3NpZCwgcmVzWzBdWyJvYmplY3RTaWQiXVswXSkKKyAgICAg
ICAgY2xzLnVucHJpdl91c2VyX2RuID0gcmVzWzBdLmRuCisgICAgICAgIAorICAgIEBjbGFzc21l
dGhvZAorICAgIGRlZiB0ZWFyRG93bkNsYXNzKGNscyk6CisgICAgICAgIGNscy5zYW1kYi5kZWxl
dGUoY2xzLnVucHJpdl91c2VyX2RuLCBbInRyZWVfZGVsZXRlOjEiXSkKKyAgICAgICAgc3VwZXIo
KS50ZWFyRG93bkNsYXNzKCkKKwogICAgIGRlZiBhZGRfY29tcHV0ZXJfbGRhcChzZWxmLCBjb21w
dXRlcm5hbWUsIG90aGVycz1Ob25lLCBzYW1kYj1Ob25lKToKICAgICAgICAgaWYgc2FtZGIgaXMg
Tm9uZToKICAgICAgICAgICAgIHNhbWRiID0gc2VsZi5zYW1kYgpAQCAtMTQxLDM0ICsxNzQsMTMg
QEAgY2xhc3MgVXNlckFjY291bnRDb250cm9sVGVzdHMoc2FtYmEudGVzdHMuVGVzdENhc2UpOgog
CiAgICAgZGVmIHNldFVwKHNlbGYpOgogICAgICAgICBzdXBlcihVc2VyQWNjb3VudENvbnRyb2xU
ZXN0cywgc2VsZikuc2V0VXAoKQotICAgICAgICBzZWxmLmFkbWluX2NyZWRzID0gY3JlZHMKLSAg
ICAgICAgc2VsZi5hZG1pbl9zYW1kYiA9IFNhbURCKHVybD1sZGFwaG9zdCwKLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNlc3Npb25faW5mbz1zeXN0ZW1fc2Vzc2lvbigpLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3JlZGVudGlhbHM9c2VsZi5hZG1pbl9jcmVk
cywgbHA9bHApCi0gICAgICAgIHNlbGYuZG9tYWluX3NpZCA9IHNlY3VyaXR5LmRvbV9zaWQoc2Vs
Zi5hZG1pbl9zYW1kYi5nZXRfZG9tYWluX3NpZCgpKQotICAgICAgICBzZWxmLmJhc2VfZG4gPSBz
ZWxmLmFkbWluX3NhbWRiLmRvbWFpbl9kbigpCi0KLSAgICAgICAgc2VsZi51bnByaXZfdXNlciA9
ICJ0ZXN0dXNlcjEiCi0gICAgICAgIHNlbGYudW5wcml2X3VzZXJfcHcgPSAic2FtYmExMjNAIgot
ICAgICAgICBzZWxmLnVucHJpdl9jcmVkcyA9IHNlbGYuZ2V0X2NyZWRzKHNlbGYudW5wcml2X3Vz
ZXIsIHNlbGYudW5wcml2X3VzZXJfcHcpCiAKICAgICAgICAgc2VsZi5PVSA9ICJPVT10ZXN0X2Nv
bXB1dGVyX291MSwlcyIgJSAoc2VsZi5iYXNlX2RuKQotCiAgICAgICAgIGRlbGV0ZV9mb3JjZShz
ZWxmLmFkbWluX3NhbWRiLCBzZWxmLk9VLCBjb250cm9scz1bInRyZWVfZGVsZXRlOjAiXSkKLSAg
ICAgICAgZGVsZXRlX2ZvcmNlKHNlbGYuYWRtaW5fc2FtZGIsICJDTj0lcyxDTj1Vc2VycywlcyIg
JSAoc2VsZi51bnByaXZfdXNlciwgc2VsZi5iYXNlX2RuKSkKLQotICAgICAgICBzZWxmLmFkbWlu
X3NhbWRiLm5ld3VzZXIoc2VsZi51bnByaXZfdXNlciwgc2VsZi51bnByaXZfdXNlcl9wdykKLSAg
ICAgICAgcmVzID0gc2VsZi5hZG1pbl9zYW1kYi5zZWFyY2goIkNOPSVzLENOPVVzZXJzLCVzIiAl
IChzZWxmLnVucHJpdl91c2VyLCBzZWxmLmFkbWluX3NhbWRiLmRvbWFpbl9kbigpKSwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2NvcGU9U0NPUEVfQkFTRSwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXR0cnM9WyJvYmplY3RTaWQiXSkKLSAg
ICAgICAgc2VsZi5hc3NlcnRFcXVhbCgxLCBsZW4ocmVzKSkKLQotICAgICAgICBzZWxmLnVucHJp
dl91c2VyX3NpZCA9IG5kcl91bnBhY2soc2VjdXJpdHkuZG9tX3NpZCwgcmVzWzBdWyJvYmplY3RT
aWQiXVswXSkKLSAgICAgICAgc2VsZi51bnByaXZfdXNlcl9kbiA9IHJlc1swXS5kbgotICAgICAg
ICBzZWxmLmFkZENsZWFudXAoc2VsZi5hZG1pbl9zYW1kYi5kZWxldGUsIHNlbGYudW5wcml2X3Vz
ZXJfZG4pCiAKKyAgICAgICAgc2VsZi51bnByaXZfY3JlZHMgPSBzZWxmLmdldF9jcmVkcyhzZWxm
LnVucHJpdl91c2VyLCBzZWxmLnVucHJpdl91c2VyX3B3KQogICAgICAgICBzZWxmLnNhbWRiID0g
U2FtREIodXJsPWxkYXBob3N0LCBjcmVkZW50aWFscz1zZWxmLnVucHJpdl9jcmVkcywgbHA9bHAp
Ci0KKyAgICAgICAgCiAgICAgICAgIHNlbGYuc2FtciA9IHNhbXIuc2FtcigibmNhY25faXBfdGNw
OiVzW3NlYWxdIiAlIGhvc3QsIGxwLCBzZWxmLnVucHJpdl9jcmVkcykKICAgICAgICAgc2VsZi5z
YW1yX2hhbmRsZSA9IHNlbGYuc2Ftci5Db25uZWN0MihOb25lLCBzZWN1cml0eS5TRUNfRkxBR19N
QVhJTVVNX0FMTE9XRUQpCiAgICAgICAgIHNlbGYuc2Ftcl9kb21haW4gPSBzZWxmLnNhbXIuT3Bl
bkRvbWFpbihzZWxmLnNhbXJfaGFuZGxlLCBzZWN1cml0eS5TRUNfRkxBR19NQVhJTVVNX0FMTE9X
RUQsIHNlbGYuZG9tYWluX3NpZCkKQEAgLTc4MCw4ICs3OTIsNCBAQCBjbGFzcyBVc2VyQWNjb3Vu
dENvbnRyb2xUZXN0cyhzYW1iYS50ZXN0cy5UZXN0Q2FzZSk6CiAgICAgICAgIHNlbGYuYWRtaW5f
c2FtZGIubW9kaWZ5KG0pCiAKIAotcnVubmVyID0gU3VidW5pdFRlc3RSdW5uZXIoKQotcmMgPSAw
Ci1pZiBub3QgcnVubmVyLnJ1bih1bml0dGVzdC5tYWtlU3VpdGUoVXNlckFjY291bnRDb250cm9s
VGVzdHMpKS53YXNTdWNjZXNzZnVsKCk6Ci0gICAgcmMgPSAxCi1zeXMuZXhpdChyYykKK1Rlc3RQ
cm9ncmFtKG1vZHVsZT1fX25hbWVfXywgb3B0cz1zdWJ1bml0b3B0cykK


--=-QL51BX7pPiLpgMNCjpTS--


