Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E16386E2A90
	for <lists+samba-technical@lfdr.de>; Fri, 14 Apr 2023 21:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=IlEfXZpWfvr2g3hFFKdv5TzcWhlo1UXiB8IGhbUswQA=; b=zvyeYbFn7M9+5C1welr2TEJw8S
	ZuVhgOBkopsdGcHd5Y8zv5zvFlwzyBjDD4K7kspEK5qaW/esl/wZwN0b1XvXr327qLzOLhInaZdfs
	wWrDcvCmr31OfzHduiFdkcV6qq/YRYUdGD1S326halmctweg5C3sc5+HeqPSvfdVJLlPjjEyObqDD
	tjep1IsMcPojeASOhJI0kX87vzAx/ZzAVWAqrFZmFnLhQgRsA7uFZxSuvuAeGR+7v8TDwK/mt7MQ2
	g0DGhdlSM5VCAjcEPkXlGSrjAcnFbi/tk+bQz+MpHkBUlWJ4fKKBxJ4IE7LumyeN7MrQy8zKy4oHw
	cYn48bjQ==;
Received: from ip6-localhost ([::1]:36614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pnOuf-001tFs-KL; Fri, 14 Apr 2023 19:16:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45230) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pnOuZ-001tFj-SD
 for samba-technical@lists.samba.org; Fri, 14 Apr 2023 19:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=IlEfXZpWfvr2g3hFFKdv5TzcWhlo1UXiB8IGhbUswQA=; b=FNTZfBhJ7VMXJVvTBM4hbJPDXO
 VlM4rzvICE43L+bqEaTa/1/Aw2ZpRgRX9YMrPvwC+xkueARCTGB/TzTRAn9CGkP5HAJFZXKRU4gFM
 xpdG5AeIQJ7Q1rrXk7JQwGstb5pET7TGCkOJvsyHZG4sWppHWJMfIzNwBj5120rYZ3yfFlVjh9cLM
 8N3GVwNcGPafbgU2BtF0hMoxabkU++VWoilAZKpupgQ8CY1+0o0hrq/YXOgcNO2Sdq+NSXCjzv0MD
 i49effEJZU30u22KDMUtQNOtAoAKVtfOnPB122s91oRP8XD6GrdZJgcGsxbhTFQxI9xkYnW4Q9+i1
 1vXA/QlxBjVWeCYxEdu6VPoTuTfsPzLe+2iNAhIwPPKzCTH8wDRhAkHEJeUNu3De1mRHMXn79Yqar
 uLBLSBqDC3YBl1XykWk9xKrbKnXCnZeTVeqUYHKS9KE20iH177FLDhUBIM1GjesYzhkrERW726yy0
 0f9V88FVs6EPlF7AEeWu8HQk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pnOuX-001CQa-V3; Fri, 14 Apr 2023 19:16:42 +0000
To: samba-technical@lists.samba.org
Subject: Re: The strange issues happening with ad_dc_ntvfs environment
Date: Fri, 14 Apr 2023 21:16:40 +0200
Message-ID: <23041389.6Emhk5qWAg@magrathea>
In-Reply-To: <3234416.44csPzL39Z@magrathea>
References: <2142927.irdbgypaU6@magrathea>
 <4cd5f631-f135-858c-5d9b-5913babef316@catalyst.net.nz>
 <3234416.44csPzL39Z@magrathea>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2558739.Lt9SDvczpP"
Content-Transfer-Encoding: 7Bit
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.

--nextPart2558739.Lt9SDvczpP
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 13 April 2023 19:47:53 CEST Andreas Schneider via samba-technical 
wrote:
> On Thursday, 13 April 2023 12:42:05 CEST Douglas Bagnall via samba-technical
> wrote:
> > On 13/04/23 20:51, Andreas Schneider wrote:
> > >> Is this with a full make test, like you were doing in February? I can
> > >> have a go at that overnight on Ubuntu 22.04.
> > > 
> > > Yes, I'm still trying to get this working downstream and I think this
> > > should still work even if CI/autobuild is not running a full make test
> > > anymore.
> > > 
> > > This seems to be a bug in some test and we should fix it.
> > > 
> > >> First I'll try `make test TESTS=ntvfs`, just in case that works.
> > > 
> > > If I run
> > > 
> > >    make -j8 test TESTS="ad_dc_ntvfs s4member"
> > > 
> > > it passes just fine :-(
> > 
> > The TESTS=ntvfs passed. A full `make test` gives me these:
> > 
> > failure: samba3.blackbox.smbstatus.test_json_profile(fileserver:local) [
> > failure:
> > samba3.blackbox.smbclient.kerberos.smbclient.smb3.kerberos.off[//fipsdc/tm
> > p] (ad_dc_fips) [
> > failure:
> > samba3.blackbox.smbclient.kerberos.smbclient.smb3.kerberos.off[//FIPSADMEM
> > BE R/tmp](ad_member_fips) [
> > failure: samba3.blackbox.smbclient_netbios_aliases [foo].smbclient
> > (krb5)(ad_member:local) [
> > failure: samba4.nbt.dgram.netlogon2(ad_dc_ntvfs) [
> > failure: samba4.ntvfs.cifs.ntlm.base.unlink.unlink(rpc_proxy) [
> 
> If I run 'make test' in the Samba git tree, I get 4 failures. If I run it in
> mockbuild as part of the RPM building process there are a lot more.
> 
> That's strange.
> 
> I need to retry it with a release tarball and release flags next.

Aha.

You can reproduce it running 'make test' in the 4.18.1 release tarball using 
the attached script to run configure.


Best regards


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
--nextPart2558739.Lt9SDvczpP
Content-Disposition: attachment; filename="configure.sh"
Content-Transfer-Encoding: base64
Content-Type: application/x-shellscript; name="configure.sh"

Q0ZMQUdTPSctTzIgLWZsdG89YXV0byAtZmZhdC1sdG8tb2JqZWN0cyAtZmV4Y2VwdGlvbnMgLWcg
LWdyZWNvcmQtZ2NjLXN3aXRjaGVzIC1waXBlIC1XYWxsIC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5
IC1XcCwtRF9GT1JUSUZZX1NPVVJDRT0yIC1XcCwtRF9HTElCQ1hYX0FTU0VSVElPTlMgLXNwZWNz
PS91c3IvbGliL3JwbS9yZWRoYXQvcmVkaGF0LWhhcmRlbmVkLWNjMSAtZnN0YWNrLXByb3RlY3Rv
ci1zdHJvbmcgLXNwZWNzPS91c3IvbGliL3JwbS9yZWRoYXQvcmVkaGF0LWFubm9iaW4tY2MxICAt
bTY0ICAtbXR1bmU9Z2VuZXJpYyAtZmFzeW5jaHJvbm91cy11bndpbmQtdGFibGVzIC1mc3RhY2st
Y2xhc2gtcHJvdGVjdGlvbiAtZmNmLXByb3RlY3Rpb24nCmV4cG9ydCBDRkxBR1MKQ1hYRkxBR1M9
Jy1PMiAtZmx0bz1hdXRvIC1mZmF0LWx0by1vYmplY3RzIC1mZXhjZXB0aW9ucyAtZyAtZ3JlY29y
ZC1nY2Mtc3dpdGNoZXMgLXBpcGUgLVdhbGwgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLVdwLC1E
X0ZPUlRJRllfU09VUkNFPTIgLVdwLC1EX0dMSUJDWFhfQVNTRVJUSU9OUyAtc3BlY3M9L3Vzci9s
aWIvcnBtL3JlZGhhdC9yZWRoYXQtaGFyZGVuZWQtY2MxIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9u
ZyAtc3BlY3M9L3Vzci9saWIvcnBtL3JlZGhhdC9yZWRoYXQtYW5ub2Jpbi1jYzEgIC1tNjQgIC1t
dHVuZT1nZW5lcmljIC1mYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMgLWZzdGFjay1jbGFzaC1w
cm90ZWN0aW9uIC1mY2YtcHJvdGVjdGlvbicKZXhwb3J0IENYWEZMQUdTCkZGTEFHUz0nLU8yIC1m
bHRvPWF1dG8gLWZmYXQtbHRvLW9iamVjdHMgLWZleGNlcHRpb25zIC1nIC1ncmVjb3JkLWdjYy1z
d2l0Y2hlcyAtcGlwZSAtV2FsbCAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtV3AsLURfRk9SVElG
WV9TT1VSQ0U9MiAtV3AsLURfR0xJQkNYWF9BU1NFUlRJT05TIC1zcGVjcz0vdXNyL2xpYi9ycG0v
cmVkaGF0L3JlZGhhdC1oYXJkZW5lZC1jYzEgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nIC1zcGVj
cz0vdXNyL2xpYi9ycG0vcmVkaGF0L3JlZGhhdC1hbm5vYmluLWNjMSAgLW02NCAgLW10dW5lPWdl
bmVyaWMgLWZhc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcyAtZnN0YWNrLWNsYXNoLXByb3RlY3Rp
b24gLWZjZi1wcm90ZWN0aW9uIC1JL3Vzci9saWI2NC9nZm9ydHJhbi9tb2R1bGVzJwpleHBvcnQg
RkZMQUdTCkZDRkxBR1M9Jy1PMiAtZmx0bz1hdXRvIC1mZmF0LWx0by1vYmplY3RzIC1mZXhjZXB0
aW9ucyAtZyAtZ3JlY29yZC1nY2Mtc3dpdGNoZXMgLXBpcGUgLVdhbGwgLVdlcnJvcj1mb3JtYXQt
c2VjdXJpdHkgLVdwLC1EX0ZPUlRJRllfU09VUkNFPTIgLVdwLC1EX0dMSUJDWFhfQVNTRVJUSU9O
UyAtc3BlY3M9L3Vzci9saWIvcnBtL3JlZGhhdC9yZWRoYXQtaGFyZGVuZWQtY2MxIC1mc3RhY2st
cHJvdGVjdG9yLXN0cm9uZyAtc3BlY3M9L3Vzci9saWIvcnBtL3JlZGhhdC9yZWRoYXQtYW5ub2Jp
bi1jYzEgIC1tNjQgIC1tdHVuZT1nZW5lcmljIC1mYXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMg
LWZzdGFjay1jbGFzaC1wcm90ZWN0aW9uIC1mY2YtcHJvdGVjdGlvbiAtSS91c3IvbGliNjQvZ2Zv
cnRyYW4vbW9kdWxlcycKZXhwb3J0IEZDRkxBR1MKTERGTEFHUz0nLVdsLC16LHJlbHJvIC1XbCwt
LWFzLW5lZWRlZCAgLVdsLC16LG5vdyAtc3BlY3M9L3Vzci9saWIvcnBtL3JlZGhhdC9yZWRoYXQt
aGFyZGVuZWQtbGQgLXNwZWNzPS91c3IvbGliL3JwbS9yZWRoYXQvcmVkaGF0LWFubm9iaW4tY2Mx
ICAtV2wsLS1idWlsZC1pZD1zaGExIC1zcGVjcz0vdXNyL2xpYi9ycG0vcmVkaGF0L3JlZGhhdC1w
YWNrYWdlLW5vdGVzJwpleHBvcnQgTERGTEFHUwpMVF9TWVNfTElCUkFSWV9QQVRIPS91c3IvbGli
NjQ6CmV4cG9ydCBMVF9TWVNfTElCUkFSWV9QQVRICmV4cG9ydCBSUE1fQVJDSD0ieDg2XzY0Igpl
eHBvcnQgUlBNX09TPSJsaW51eCIKZXhwb3J0IFJQTV9QQUNLQUdFX05BTUU9InNhbWJhIgpleHBv
cnQgUlBNX1BBQ0tBR0VfUkVMRUFTRT0iMC5mYzM3IgpleHBvcnQgUlBNX1BBQ0tBR0VfVkVSU0lP
Tj0iNC4xOC4xIgouL2NvbmZpZ3VyZSAtLWJ1aWxkPXg4Nl82NC1yZWRoYXQtbGludXgtZ251IC0t
aG9zdD14ODZfNjQtcmVkaGF0LWxpbnV4LWdudSAtLXByb2dyYW0tcHJlZml4PSAtLWRpc2FibGUt
ZGVwZW5kZW5jeS10cmFja2luZyAtLXByZWZpeD0vdXNyIC0tZXhlYy1wcmVmaXg9L3VzciAtLWJp
bmRpcj0vdXNyL2JpbiAtLXNiaW5kaXI9L3Vzci9zYmluIC0tc3lzY29uZmRpcj0vZXRjIC0tZGF0
YWRpcj0vdXNyL3NoYXJlIC0taW5jbHVkZWRpcj0vdXNyL2luY2x1ZGUgLS1saWJkaXI9L3Vzci9s
aWI2NCAtLWxpYmV4ZWNkaXI9L3Vzci9saWJleGVjIC0tbG9jYWxzdGF0ZWRpcj0vdmFyIC0tc2hh
cmVkc3RhdGVkaXI9L3Zhci9saWIgLS1tYW5kaXI9L3Vzci9zaGFyZS9tYW4gLS1pbmZvZGlyPS91
c3Ivc2hhcmUvaW5mbyAtLWVuYWJsZS1maHMgLS13aXRoLXBpZGRpcj0vcnVuIC0td2l0aC1zb2Nr
ZXRzLWRpcj0vcnVuL3NhbWJhIC0td2l0aC1tb2R1bGVzZGlyPS91c3IvbGliNjQvc2FtYmEgLS13
aXRoLXBhbW1vZHVsZXNkaXI9L3Vzci9saWI2NC9zZWN1cml0eSAtLXdpdGgtbG9ja2Rpcj0vdmFy
L2xpYi9zYW1iYS9sb2NrIC0td2l0aC1zdGF0ZWRpcj0vdmFyL2xpYi9zYW1iYSAtLXdpdGgtY2Fj
aGVkaXI9L3Zhci9saWIvc2FtYmEgLS1kaXNhYmxlLXJwYXRoLWluc3RhbGwgLS13aXRoLXNoYXJl
ZC1tb2R1bGVzPWlkbWFwX2FkLGlkbWFwX3JpZCxpZG1hcF9sZGFwLGlkbWFwX2hhc2gsaWRtYXBf
dGRiMixwZGJfdGRic2FtLHBkYl9sZGFwLHBkYl9zbWJwYXNzd2QscGRiX3diY19zYW0scGRiX3Nh
bWJhNCxhdXRoX3diYyxhdXRoX3VuaXgsYXV0aF9zZXJ2ZXIsYXV0aF9zYW1iYTQsYXV0aF9za2Vs
LHZmc19kZnNfc2FtYmE0LHZmc19mYWtlX2RmcSAnLS1idW5kbGVkLWxpYnJhcmllcz0hcG9wdCx0
YWxsb2MscHl0YWxsb2MscHl0YWxsb2MtdXRpbCx0ZXZlbnQscHl0ZXZlbnQsdGRiLHB5dGRiLGxk
YixweWxkYixweWxkYi11dGlsJyAtLXdpdGgtcGFtIC0td2l0aC1waWUgLS13aXRoLXJlbHJvIC0t
d2l0aG91dC1mYW0gLS13aXRoLXN5c3RlbS1taXRrcmI1IC0td2l0aC1leHBlcmltZW50YWwtbWl0
LWFkLWRjIC0td2l0aC1jbHVzdGVyLXN1cHBvcnQgLS1lbmFibGUtc2VsZnRlc3QgLS1lbmFibGUt
cG1kYSAtLWVuYWJsZS1jZXBoLXJlY2xvY2sgLS1lbmFibGUtZXRjZC1yZWNsb2NrIC0td2l0aC1w
cm9maWxpbmctZGF0YSAtLXdpdGgtc3lzdGVtZCAtLXdpdGgtcXVvdGFzIC0tc3lzdGVtZC1pbnN0
YWxsLXNlcnZpY2VzIC0td2l0aC1zeXN0ZW1kZGlyPS91c3IvbGliL3N5c3RlbWQvc3lzdGVtIC0t
c3lzdGVtZC1zbWItZXh0cmE9RW52aXJvbm1lbnQ9S1JCNUNDTkFNRT1GSUxFOi9ydW4vc2FtYmEv
a3JiNWNjX3NhbWJhIC0tc3lzdGVtZC1ubWItZXh0cmE9RW52aXJvbm1lbnQ9S1JCNUNDTkFNRT1G
SUxFOi9ydW4vc2FtYmEva3JiNWNjX3NhbWJhIC0tc3lzdGVtZC13aW5iaW5kLWV4dHJhPUVudmly
b25tZW50PUtSQjVDQ05BTUU9RklMRTovcnVuL3NhbWJhL2tyYjVjY19zYW1iYSAtLXN5c3RlbWQt
Y3RkYi1leHRyYT1FbnZpcm9ubWVudD1LUkI1Q0NOQU1FPUZJTEU6L3J1bi9zYW1iYS9rcmI1Y2Nf
c2FtYmEgLS1zeXN0ZW1kLXNhbWJhLWV4dHJhPUVudmlyb25tZW50PUtSQjVDQ05BTUU9RklMRTov
cnVuL3NhbWJhL2tyYjVjY19zYW1iYQo=


--nextPart2558739.Lt9SDvczpP--




